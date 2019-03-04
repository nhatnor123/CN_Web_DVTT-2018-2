<?php
        $fullname = $_POST["fullname"];
        $birthday = $_POST["birthday"];
        $gender = $_POST["gender"];
        $hometown = $_POST["hometown"];
        $university = $_POST["university"];
        $graduation = $_POST["graduation"];
        $hobby = $_POST["hobby"];
        $codeLanguage = $_POST["codeLanguage"];

    ?>
<!DOCTYPE html>
<html>
<head>
    <title>Lap3.1</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body>
    <center>
        <table>
            <thead>
                <th><h3>Thông tin của sinh viên</h3></th>
            </thead>

            <tbody>
                <tr>
                    <td>Tên vừa nhập</td>
                    <td><?php echo $fullname;  ?></td>
                </tr>
                <tr>
                    <td>Ngày sinh</td>
                    <td><?php echo $birthday; ?></td>
                </tr>
                <tr>
                    <td>Giới tính</td>
                    <td>
                        <?php echo $gender; ?>
                    </td>
                </tr>
                <tr>
                    <td>Quê quán</td>
                    <td><?php  echo $hometown; ?></td>
                </tr>
                <tr>
                    <td>Sinh viên trường</td>
                    <td><?php echo $university; ?></td>
                </tr>
                <tr>
                    <td>Năm tốt nghiệp</td>
                    <td><?php echo $graduation; ?></td>
                </tr>
                <tr>
                    <td>Sở thích cá nhân</td>
                    <td>
                        <?php
                            foreach ($hobby as $key => $value) {
                                echo $value."    ";
                             } 
                        ?>
                    </td>
                </tr>
                <tr>
                    <td>Đã lập trình với</td>
                    <td>
                        <?php
                            foreach ($codeLanguage as $key => $value) {
                                echo '<p>'.$value.'</p>';
                             } 
                        ?>
                    </td>
                </tr>
            </tbody>
        </table>
    </center>
</body>
</html>