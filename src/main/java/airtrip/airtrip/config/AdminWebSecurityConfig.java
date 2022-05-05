package airtrip.airtrip.config;
import airtrip.airtrip.service.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import javax.sql.DataSource;


@Configuration
@EnableWebSecurity
@Order(1)
public class AdminWebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsServiceImpl userDetailsService;

    @Autowired
    private DataSource dataSource;

    AppConfig appConfig = new AppConfig();

//        @Bean
//        public BCryptPasswordEncoder passwordEncoder() {
//            BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
//            return bCryptPasswordEncoder;
//        }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(appConfig.passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.csrf().disable();

        // Các trang không yêu cầu login
        http.authorizeRequests().antMatchers("/", "/admin/login", "/admin/logout").permitAll();

        // Trang /userInfo yêu cầu phải login với vai trò ROLE_USER hoặc ROLE_ADMIN.
        // Nếu chưa login, nó sẽ redirect tới trang /login.
//        http.authorizeRequests().antMatchers("/userInfo").access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')");

        // Trang chỉ dành cho ADMIN
       // http.authorizeRequests().antMatchers("/admin").access("hasRole('ROLE_ADMIN')");

        // Khi người dùng đã login, với vai trò XX.
        // Nhưng truy cập vào trang yêu cầu vai trò YY,
        // Ngoại lệ AccessDeniedException sẽ ném ra.
//        http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");

        // Cấu hình cho Login Form.
        http.antMatcher("/admin/**").authorizeRequests().antMatchers("/admin/adminInfo").access("hasRole('ROLE_ADMIN')")
                .and().formLogin()//
                // Submit URL của trang login
                .loginProcessingUrl("/admin/j_spring_security_check") // Submit URL
                .loginPage("/admin/login")//
                .defaultSuccessUrl("/admin/adminInfo")//
                .failureUrl("/admin/login?error=true")//
                .usernameParameter("username")//
                .passwordParameter("password")
                .and().exceptionHandling().accessDeniedPage("/admin/403")
                .and().logout().logoutUrl("/admin/logout").logoutSuccessUrl("/admin/logoutSuccessful");

    }

}