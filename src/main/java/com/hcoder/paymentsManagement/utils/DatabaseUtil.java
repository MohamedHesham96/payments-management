package com.hcoder.paymentsManagement.utils;

import com.smattme.MysqlExportService;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;

public final class DatabaseUtil {
    public static void backup(String dbUsername, String dbPassword, String dbName, String outputFile) throws SQLException, IOException, ClassNotFoundException {
        Properties properties = new Properties();
        properties.setProperty(MysqlExportService.DB_NAME, dbName);
        properties.setProperty(MysqlExportService.DB_USERNAME, dbUsername);
        properties.setProperty(MysqlExportService.DB_PASSWORD, dbPassword);
        properties.setProperty(MysqlExportService.TEMP_DIR, new File(outputFile).getPath());
        properties.setProperty(MysqlExportService.PRESERVE_GENERATED_ZIP, "true");
        MysqlExportService mysqlExportService = new MysqlExportService(properties);
        mysqlExportService.export();
    }
}