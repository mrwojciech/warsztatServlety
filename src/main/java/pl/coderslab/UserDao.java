package pl.coderslab;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    public static final String CREATE_USER_QUERY = "INSERT INTO users(username, email, password) VALUES (?,?,?)";
    public static final String READ_USER_WITH_ID_QUERY = "SELECT * FROM users WHERE id=?";
    public static final String READ_ALL_USERS = "SELECT * FROM users";
    public static final String UPDATE_USER_WITH_ID_QUERY = "UPDATE users SET email=?, username=?, password=? where id=?";
    public static final String UPDATE_USERNAME_FOR_USER_ID_QUERY = "UPDATE users SET username=? where id=?";
    public static final String UPDATE_EMAIL_FOR_USER_ID_QUERY = "UPDATE users SET email=? where id=?";
    public static final String UPDATE_PASSWORD_FOR_USER_ID_QUERY = "UPDATE users SET password=? where id=?";
    public static final String DELETE_USER_WITH_ID_QUERY = "DELETE FROM users WHERE id=?";

    public User create(User user) {
        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement statement = conn.prepareStatement(CREATE_USER_QUERY, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPassword());
            statement.executeUpdate();
            ResultSet resultSet = statement.getGeneratedKeys();
            if (resultSet.next()) {
                user.setId(resultSet.getInt(1));
            }
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public User read(int userId) {
        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement statement = conn.prepareStatement(READ_USER_WITH_ID_QUERY);
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int id = resultSet.getInt("id");
                String userName = resultSet.getString("username");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                User user = new User(id, userName, email, password);
                return user;
            } else {
                System.out.println("Nie istnieje User o podanym id: " + userId);
            }
            return null;
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return null;
    }

    public User update(User user) {
        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement statement = conn.prepareStatement(UPDATE_USER_WITH_ID_QUERY);
            statement.setString(1, user.getEmail());
            statement.setString(2, user.getUsername());
            statement.setString(3, user.getPassword());
            statement.setInt(4, user.getId());
            int i = statement.executeUpdate();
            if (i == 1) {
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void delete(int userId) {
        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement statement = conn.prepareStatement(DELETE_USER_WITH_ID_QUERY);
            statement.setInt(1, userId);
            int i = statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<User> findAll() {
        try (Connection conn = DbUtil.getConnection()) {
            List<User> users = new ArrayList<>();
            PreparedStatement statement = conn.prepareStatement(READ_ALL_USERS);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String userName = resultSet.getString("username");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                User user = new User(id, userName, email, password);
                users.add(user);
            }
            return users;
        } catch (SQLException e) {
            System.err.println(e.getMessage());
            throw new RuntimeException(e);
        }
    }

}
