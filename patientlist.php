<?php
// Include the database connection
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
header('Content-Type: application/json');
require "dbh.php"; // This file contains the PDO connection setup

// Prepare SQL query to fetch relevant fields
$sql = "SELECT patient_id, prediction FROM images"; // Select only patient_id and prediction

try {
    // Execute the query
    $stmt = $conn->prepare($sql);
    $stmt->execute();

    // Fetch all records
    $patients = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (count($patients) > 0) {
        // Return patients array as JSON response
        header('Content-Type: application/json');
        echo json_encode($patients);
    } else {
        // No patients found
        $response = array("status" => "error", "message" => "No patients found");
        echo json_encode($response);
    }

    // Close the statement
    $stmt->closeCursor();
    
} catch (PDOException $e) {
    // Handle errors during query execution
    $response = array("status" => "error", "message" => "Database error: " . $e->getMessage());
    echo json_encode($response);
}

// Close the database connection
$conn = null;
?>
