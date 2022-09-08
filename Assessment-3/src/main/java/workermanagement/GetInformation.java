package workermanagement;

import java.sql.*;
import java.util.Scanner;

public class GetInformation implements InitDBVars {
    private static Statement statement = null;

    private Statement getStatement() throws SQLException {
        return DriverManager.getConnection(MYSQL_URL, USERNAME, PASSWORD)
                .createStatement();
    }

    private void displayFullNames() throws SQLException {
        String getFullNameSql = "select upper(concat(FIRST_NAME, ' ', LAST_NAME)) as FULL_NAME from Worker_Table_1";
        ResultSet resultSet = statement.executeQuery(getFullNameSql);
        ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
        System.out.println(resultSetMetaData.getColumnName(1));
        System.out.println("---------------");
        while(resultSet.next()) {
            System.out.println(resultSet.getString(1));
        }
    }

    private void displayUniqueDepartments() throws SQLException {
        String getUniqueDepartments = "select distinct DEPARTMENT from Worker_Table_1";
        ResultSet resultSet = statement.executeQuery(getUniqueDepartments);
        ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
        System.out.println(resultSetMetaData.getColumnName(1));
        System.out.println("---------------");
        while(resultSet.next()) {
            System.out.println(resultSet.getString(1));
        }
    }

    private void displayPositionOfCharacter(char target) throws SQLException {
        String getPositionOfCharacter = "select FIRST_NAME, position('" + target + "' in FIRST_NAME) as POSITION from Worker_Table_1";

        ResultSet resultSet = statement.executeQuery(getPositionOfCharacter);
        ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
        System.out.printf("%10s\t%15s%n", resultSetMetaData.getColumnName(1), resultSetMetaData.getColumnName(2));
        System.out.println("-----------------------------");
        while(resultSet.next()) {
            System.out.printf("%10s\t\t\t\t%2d%n", resultSet.getString(1), resultSet.getInt(2));
        }
    }

    private void errorMessage() {
        System.out.println("Unable to fetch the requested data!");
        System.out.println("Try again later.");
        System.exit(-1);
    }

    public static void main(String[] args) {
        GetInformation getInformation = new GetInformation();

        try {
            statement = getInformation.getStatement();
        } catch (Exception exception) {
            System.out.println("Unable to connect to the database!");
            System.out.println("Check if your MySQL server is up and running. "
                    + "Also check if you entered the correct username and password.");
            System.out.println();
            System.exit(-1);
        }

        try {
            getInformation.displayFullNames();
        } catch (SQLException sqlException) {
            getInformation.errorMessage();
        }
        System.out.println();

        try {
            getInformation.displayUniqueDepartments();
        } catch (SQLException sqlException) {
            getInformation.errorMessage();
        }
        System.out.println();

        char target;
        while (true) {
            Scanner scanner = new Scanner(System.in);
            System.out.println("Enter a character to search for in the FIRST_NAME column: ");
            String inputString = scanner.next();
            if (inputString.length() > 1) {
                System.out.println("Please enter a single character!");
            } else {
                target = inputString.charAt(0);
                break;
            }
        }

        try {
            getInformation.displayPositionOfCharacter(target);
        } catch (SQLException sqlException) {
            getInformation.errorMessage();
        }
        System.out.println();
    }
}
