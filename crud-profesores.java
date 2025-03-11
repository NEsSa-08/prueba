import java.sql.*;
import java.util.ArrayList;
import java.util.List;


class Profesor {
    private int claveProfesor;
    private String nombreProfesor;

    public Profesor(int claveProfesor, String nombreProfesor) {
        this.claveProfesor = claveProfesor;
        this.nombreProfesor = nombreProfesor;
    }

    public int getClaveProfesor() { return claveProfesor; }
    public String getNombreProfesor() { return nombreProfesor; }
}

class ConexionDB {
    private static final String URL = "jdbc:mysql://localhost:3306/dbtaller";
    private static final String USER = "root";
    private static final String PASSWORD = "0803";

    public static Connection conectar() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}

// CRUD para Profesor
class ProfesorDAO {
    public void create(Profesor profesor) throws SQLException {
        String sql = "INSERT INTO profesor (nombre_profesor) VALUES (?)";
        try (Connection conn = ConexionDB.conectar(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, profesor.getNombreProfesor());
            stmt.executeUpdate();
        }
    }

    public List<Profesor> read() throws SQLException {
        List<Profesor> profesores = new ArrayList<>();
        String sql = "SELECT * FROM profesor";
        try (Connection conn = ConexionDB.conectar(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                profesores.add(new Profesor(rs.getInt("clave_profesor"), rs.getString("nombre_profesor")));
            }
        }
        return profesores;
    }

    public void update(Profesor profesor) throws SQLException {
        String sql = "UPDATE profesor SET nombre_profesor = ? WHERE clave_profesor = ?";
        try (Connection conn = ConexionDB.conectar(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, profesor.getNombreProfesor());
            stmt.setInt(2, profesor.getClaveProfesor());
            stmt.executeUpdate();
        }
    }

    public void delete(int claveProfesor) throws SQLException {
        String sql = "DELETE FROM profesor WHERE clave_profesor = ?";
        try (Connection conn = ConexionDB.conectar(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, claveProfesor);
            stmt.executeUpdate();
        }
    }
}


