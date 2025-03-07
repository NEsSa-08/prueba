import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TipoProyectoCRUD {

    private static final String URL = "jdbc:mysql://localhost:3306/dbtaller";
    private static final String USER = "root";
    private static final String PASSWORD = "0803";

    public static void main(String[] args) {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
            
            crearTipoProyecto(conn, "Investigación");
           
            leerTiposProyecto(conn);

            actualizarTipoProyecto(conn, 1, "Desarrollo Tecnológico");

            eliminarTipoProyecto(conn, 1);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void crearTipoProyecto(Connection conn, String nombre) throws SQLException {
        String sql = "INSERT INTO tipoproyec (nombre_tipo) VALUES (?)";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, nombre);
            pstmt.executeUpdate();
            System.out.println("Tipo de proyecto creado: " + nombre);
        }
    }

    private static void leerTiposProyecto(Connection conn) throws SQLException {
        String sql = "SELECT * FROM tipoproyec";
        try (PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                System.out.println("Clave: " + rs.getInt("clave_tipo") + ", Nombre: " + rs.getString("nombre_tipo"));
            }
        }
    }

    private static void actualizarTipoProyecto(Connection conn, int clave, String nuevoNombre) throws SQLException {
        String sql = "UPDATE tipoproyec SET nombre_tipo = ? WHERE clave_tipo = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, nuevoNombre);
            pstmt.setInt(2, clave);
            pstmt.executeUpdate();
            System.out.println("Tipo de proyecto actualizado: " + clave);
        }
    }

    private static void eliminarTipoProyecto(Connection conn, int clave) throws SQLException {
        String sql = "DELETE FROM tipoproyec WHERE clave_tipo = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, clave);
            pstmt.executeUpdate();
            System.out.println("Tipo de proyecto eliminado: " + clave);
        }
    }
}