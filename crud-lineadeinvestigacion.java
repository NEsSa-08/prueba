import java.sql.*;
import java.util.*;


class ConexionDB {
    private static final String URL = "jdbc:mysql://localhost:3306/dbtaller";
    private static final String USER = "root";
    private static final String PASSWORD = "0803";

    public static Connection conectar() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}

// CRUD para LineaInvestigacion
class LineaInvestigacion {
    private int claveLinea;
    private String nombreLinea;

    public LineaInvestigacion(int claveLinea, String nombreLinea) {
        this.claveLinea = claveLinea;
        this.nombreLinea = nombreLinea;
    }

    public int getClaveLinea() { return claveLinea; }
    public String getNombreLinea() { return nombreLinea; }
}

class LineaInvestigacionDAO {
    public void create(LineaInvestigacion linea) throws SQLException {
        String sql = "INSERT INTO LineaInvestigacion (NombreLinea) VALUES (?)";
        try (Connection conn = ConexionDB.conectar(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, linea.getNombreLinea());
            stmt.executeUpdate();
        }
    }

    public List<LineaInvestigacion> read() throws SQLException {
        List<LineaInvestigacion> lineas = new ArrayList<>();
        String sql = "SELECT * FROM LineaInvestigacion";
        try (Connection conn = ConexionDB.conectar(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                lineas.add(new LineaInvestigacion(rs.getInt("ClaveLinea"), rs.getString("NombreLinea")));
            }
        }
        return lineas;
    }

    public void update(LineaInvestigacion linea) throws SQLException {
        String sql = "UPDATE LineaInvestigacion SET NombreLinea = ? WHERE ClaveLinea = ?";
        try (Connection conn = ConexionDB.conectar(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, linea.getNombreLinea());
            stmt.setInt(2, linea.getClaveLinea());
            stmt.executeUpdate();
        }
    }

    public void delete(int claveLinea) throws SQLException {
        String sql = "DELETE FROM LineaInvestigacion WHERE ClaveLinea = ?";
        try (Connection conn = ConexionDB.conectar(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, claveLinea);
            stmt.executeUpdate();
        }
    }
}

// menu
public class MenuLineaInvestigacion {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        LineaInvestigacionDAO dao = new LineaInvestigacionDAO();

        while (true) {
            System.out.println("1. Agregar Línea de Investigación");
            System.out.println("2. Mostrar Líneas de Investigación");
            System.out.println("3. Actualizar Línea de Investigación");
            System.out.println("4. Eliminar Línea de Investigación");
            System.out.println("5. Salir");
            System.out.print("Seleccione una opción: ");
            int opcion = scanner.nextInt();
            scanner.nextLine();

            try {
                switch (opcion) {
                    case 1:
                        System.out.print("Ingrese nombre de la línea: ");
                        String nombre = scanner.nextLine();
                        dao.create(new LineaInvestigacion(0, nombre));
                        break;
                    case 2:
                        for (LineaInvestigacion l : dao.read()) {
                            System.out.println(l.getClaveLinea() + " - " + l.getNombreLinea());
                        }
                        break;
                    case 3:
                        System.out.print("Ingrese clave de la línea a actualizar: ");
                        int clave = scanner.nextInt();
                        scanner.nextLine();
                        System.out.print("Ingrese nuevo nombre: ");
                        String nuevoNombre = scanner.nextLine();
                        dao.update(new LineaInvestigacion(clave, nuevoNombre));
                        break;
                    case 4:
                        System.out.print("Ingrese clave de la línea a eliminar: ");
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
