package utils;

public enum ParameterNames {
    LOGIN("login"), PASSWORD("password"), AUTH_TOKEN("auth-token"), IS_LOGGED_IN("isLoggedIn");

    private final String name;

    ParameterNames(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
