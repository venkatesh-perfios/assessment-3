package workermanagement;

public interface InitDBVars {
    String DB_NAME = "Worker_Management";
    String MYSQL_URL = "jdbc:mysql://localhost:3306/" + DB_NAME;
    String USERNAME = "root";
    String PASSWORD = "password";
}
