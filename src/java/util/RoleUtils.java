package util;

import javax.servlet.http.HttpSession;

public class RoleUtils {
    public static boolean isAdmin(HttpSession session) {
        String role = (String) session.getAttribute("role");
        return role != null && role.equals("admin");
    }

    public static boolean isStaff(HttpSession session) {
        String role = (String) session.getAttribute("role");
        return role != null && role.equals("staff");
    }
}
