<?php
// Include the database connection
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
header('Content-Type: application/json');
require "dbh.php"; // This file contains the PDO connection setup

// Directory to save the uploaded images
$target_dir = "uploads/";

// File path of the uploaded file
$target_file = $target_dir . basename($_FILES["image"]["name"]);

// Flag to track the upload status
$uploadOk = 1;

// File extension of the uploaded image
$imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

// Get patient ID, class name, and confidence score from POST request
$patient_id = $_POST['patient_id'];
$class_name = $_POST['class_name'];
$confidence_score = $_POST['confidence_score'];

// Check if the file is an actual image
if (isset($_FILES["image"])) {
    $check = getimagesize($_FILES["image"]["tmp_name"]);
    if ($check !== false) {
        $uploadOk = 1;
    } else {
        echo "File is not an image.";
        $uploadOk = 0;
    }
}

// Check if file already exists
if (file_exists($target_file)) {
    echo "Sorry, file already exists.";
    $uploadOk = 0;
}

// Check file size (limit is 5MB)
if ($_FILES["image"]["size"] > 5000000) {
    echo "Sorry, your file is too large.";
    $uploadOk = 0;
}

// Allow only specific file formats
if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif") {
    echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
    $uploadOk = 0;
}

// Try to upload the file if everything is okay
if ($uploadOk == 1) {
    if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
        // Prepare SQL query to insert image details along with patient ID and prediction
        $sql = "INSERT INTO images (image_name, image_path, patient_id, prediction, confidence_score) 
                VALUES (:image_name, :image_path, :patient_id, :prediction, :confidence_score)";

        $stmt = $conn->prepare($sql);

        // Bind parameters to the prepared statement
        $stmt->bindParam(':image_name', basename($_FILES["image"]["name"]), PDO::PARAM_STR);
        $stmt->bindParam(':image_path', $target_file, PDO::PARAM_STR);
        $stmt->bindParam(':patient_id', $patient_id, PDO::PARAM_INT);
        $stmt->bindParam(':prediction', $class_name, PDO::PARAM_STR);
        $stmt->bindParam(':confidence_score', $confidence_score, PDO::PARAM_STR);

        // Execute the query
        if ($stmt->execute()) {
            echo "The image has been uploaded and the details have been saved successfully.";
        } else {
            echo "Error saving image details: " . $stmt->errorInfo()[2];
        }
    } else {
        echo "Sorry, there was an error uploading your file.";
    }
} else {
    echo "Sorry, your file was not uploaded.";
}

// Close the database connection
$conn = null;
?>
