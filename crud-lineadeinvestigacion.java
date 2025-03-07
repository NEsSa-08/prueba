import java.sql.*;
import java.util.*;
public class conexion {
    private static final String URL = "jdbc:mysql://localhost:3306/dbtaller";
    private static String USUARIO;
    private static String CONTRASEÑA;

    private static Connection conectar() throws SQLException {
        return DriverManager.getConnection(URL, USUARIO, CONTRASEÑA);
        
    }    
    public static void insertarLineaInvestigacion(Connection connection, String nombreLinea) throws SQLException {
        String sql = "INSERT INTO LineaInvestigacion (NombreLinea) VALUES (?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, nombreLinea);
            statement.executeUpdate();
        }
    }

    public static List<String> obtenerLineasInvestigacion(Connection connection) throws SQLException {
        List<String> lineas = new ArrayList<>();
        String sql = "SELECT NombreLinea FROM LineaInvestigacion";
        try (PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                lineas.add(resultSet.getString("NombreLinea"));
            }
        }
        return lineas;
    }

    
    public static void actualizarLineaInvestigacion(Connection connection, int claveLinea, String nuevoNombre) throws SQLException {
        String sql = "UPDATE LineaInvestigacion SET NombreLinea = ? WHERE ClaveLinea = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, nuevoNombre);
            statement.setInt(2, claveLinea);
            statement.executeUpdate();
        }
    }

   
    public static void eliminarLineaInvestigacion(Connection connection, int claveLinea) throws SQLException {
        String sql = "DELETE FROM LineaInvestigacion WHERE ClaveLinea = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, claveLinea);
            statement.executeUpdate();
        }
    }
}