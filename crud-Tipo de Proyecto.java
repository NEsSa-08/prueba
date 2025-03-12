import java.sql.*;
import java.util.*;

// Clase para conexión a la base de datos
class ConexionDB {
    private static final String URL = "jdbc:mysql://localhost:3306/dbtaller";
    private static final String USER = "root";
    private static final String PASSWORD = "0803";

    public static Connection conectar() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}

// Clase para Tipo de Proyecto
class TipoProyecto {
    private int claveTipo;
    private String nombreTipo;

    public TipoProyecto(int claveTipo, String nombreTipo) {
        this.claveTipo = claveTipo;
        this.nombreTipo = nombreTipo;
    }

    public int getClaveTipo() { return claveTipo; }
    public String getNombreTipo() { return nombreTipo; }
}

class TipoProyectoDAO {
    public void create(TipoProyecto tipo) throws SQLException {
        String sql = "INSERT INTO tipoproyec (nombre_tipo) VALUES (?)";
        try (Connection conn = ConexionDB.conectar(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, tipo.getNombreTipo());
            stmt.executeUpdate();
        }
    }

    public List<TipoProyecto> read() throws SQLException {
        List<TipoProyecto> tipos = new ArrayList<>();
        String sql = "SELECT * FROM tipoproyec";
        try (Connection conn = ConexionDB.conectar(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                tipos.add(new TipoProyecto(rs.getInt("clave_tipo"), rs.getString("nombre_tipo")));
            }
        }
        return tipos;
    }

    public void update(TipoProyecto tipo) throws SQLException {
        String sql = "UPDATE tipoproyec SET nombre_tipo = ? WHERE clave_tipo = ?";
        try (Connection conn = ConexionDB.conectar(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, tipo.getNombreTipo());
            stmt.setInt(2, tipo.getClaveTipo());
            stmt.executeUpdate();
        }
    }

    public void delete(int claveTipo) throws SQLException {
        String sql = "DELETE FROM tipoproyec WHERE clave_tipo = ?";
        try (Connection conn = ConexionDB.conectar(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, claveTipo);
            stmt.executeUpdate();
        }
    }
}

public class MenuTipoProyecto {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        TipoProyectoDAO dao = new TipoProyectoDAO();

        while (true) {
            System.out.println("1. Agregar Tipo de Proyecto");
            System.out.println("2. Mostrar Tipos de Proyecto");
            System.out.println("3. Actualizar Tipo de Proyecto");
            System.out.println("4. Eliminar Tipo de Proyecto");
            System.out.println("5. Salir");
            System.out.print("Seleccione una opción: ");
            int opcion = scanner.nextInt();
            scanner.nextLine();

            try {
                switch (opcion) {
                    case 1:
                        System.out.print("Ingrese nombre del tipo de proyecto: ");
                        String nombre = scanner.nextLine();
                        dao.create(new TipoProyecto(0, nombre));
                        break;
                    case 2:
                        for (TipoProyecto t : dao.read()) {
                            System.out.println(t.getClaveTipo() + " - " + t.getNombreTipo());
                        }
                        break;
                    case 3:
                        System.out.print("Ingrese clave del tipo a actualizar: ");
                        int clave = scanner.nextInt();
                        scanner.nextLine();
                        System.out.print("Ingrese nuevo nombre: ");
                        String nuevoNombre = scanner.nextLine();
                        dao.update(new TipoProyecto(clave, nuevoNombre));
                        break;
                    case 4:
                        System.out.print("Ingrese clave del tipo a eliminar: ");
                        int claveEliminar = scanner.nextInt();
                        dao.delete(claveEliminar);
                        break;
                    case 5:
                        System.out.println("Saliendo...");
                        scanner.close();
                        return;
                    default:
                        System.out.println("Opción no válida.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

