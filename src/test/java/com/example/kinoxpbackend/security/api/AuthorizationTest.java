package com.example.kinoxpbackend.security.api;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.example.kinoxpbackend.security.TestUtils;
import com.example.kinoxpbackend.security.dto.LoginRequest;
import com.example.kinoxpbackend.security.dto.LoginResponse;
import com.example.kinoxpbackend.security.repository.RoleRepository;
import com.example.kinoxpbackend.security.repository.UserWithRolesRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.HttpHeaders;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.transaction.annotation.Transactional;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

//You can enable/disable these tests in you maven builds via the maven-surefire-plugin, in your pom-file
@Tag("DisabledSecurityTest")
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@Transactional
public class AuthorizationTest {

  @Autowired
  MockMvc mockMvc;
  @Autowired
  UserWithRolesRepository userWithRolesRepository;

  @Autowired
  RoleRepository roleRepository;

  @Autowired
  PasswordEncoder passwordEncoder;

  private final ObjectMapper objectMapper = new ObjectMapper();

  public static String userJwtToken;
  public static String adminJwtToken;
  public static String user_adminJwtToken;
  public static String user_noRolesJwtToken;

  void LoginAndGetTokens() throws Exception {
    user_adminJwtToken = loginAndGetToken("u1");
    userJwtToken = loginAndGetToken("u2");
    adminJwtToken = loginAndGetToken("u3");
    user_noRolesJwtToken = loginAndGetToken("u4");
  }

  @BeforeEach
  void setUp() throws Exception {
    TestUtils.setupTestUsers(userWithRolesRepository,roleRepository,passwordEncoder);
    if(user_adminJwtToken==null) {
      LoginAndGetTokens();
    }
  }

  String loginAndGetToken(String user) throws Exception {
    LoginRequest loginRequest = new LoginRequest(user, "secret");
    MvcResult response = mockMvc.perform(post("/api/auth/login")
                    .contentType("application/json")
                    .content(objectMapper.writeValueAsString(loginRequest)))
            .andExpect(status().isOk())
            .andReturn();
    LoginResponse loginResponse = objectMapper.readValue(response.getResponse().getContentAsString(), LoginResponse.class);
    return loginResponse.getToken();
  }


  @Test
  void testRolesAdmin() throws Exception {
    mockMvc.perform(get("/api/security-tests/admin")
                    .header(HttpHeaders.AUTHORIZATION, "Bearer " + adminJwtToken)
                    .contentType("application/json"))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.userName").value("u3"))
            .andExpect(jsonPath("$.message").value("Admin"));
  }
  @Test
  void testEndpointAdminWrongRole() throws Exception {
    mockMvc.perform(get("/api/security-tests/admin")
                    .header(HttpHeaders.AUTHORIZATION, "Bearer " + userJwtToken)
                    .contentType("application/json"))
            .andExpect(status().isForbidden());
  }
  @Test
  void testRolesAdminNotLoggedIn() throws Exception {
    mockMvc.perform(get("/api/security-tests/admin")
                    .contentType("application/json"))
            .andExpect(status().isUnauthorized());
  }
  @Test
  void testAuthenticatedNoRoles() throws Exception {
    mockMvc.perform(get("/api/security-tests/authenticated")
                    .header(HttpHeaders.AUTHORIZATION, "Bearer " + user_noRolesJwtToken)
                    .contentType("application/json"))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.userName").value("u4"))
            .andExpect(jsonPath("$.message").value("Authenticated user"));
  }
}