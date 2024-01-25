

<?php 

class DatabaseTableStructure {
    public static function displayTableStructure($tableName) {

        // Fetch table structure
        $result = connexion::getConnexion()->query("DESCRIBE $tableName");
        debug($result) ; 

        if ($result->num_rows > 0) {
            echo '<table border="1">
                    <tr>
                        <th>Field</th>
                        <th>Type</th>
                        <th>Null</th>
                        <th>Key</th>
                        <th>Default</th>
                        <th>Extra</th>
                    </tr>';

            while ($row = $result->fetchAll(PDO::FETCH_ASSOC)) {
                echo '<tr>
                        <td>' . $row['Field'] . '</td>
                        <td>' . $row['Type'] . '</td>
                        <td>' . $row['Null'] . '</td>
                        <td>' . $row['Key'] . '</td>
                        <td>' . $row['Default'] . '</td>
                        <td>' . $row['Extra'] . '</td>
                    </tr>';
            }

            echo '</table>';
        } else {
            echo 'Table not found or empty.';
        }
    }
}