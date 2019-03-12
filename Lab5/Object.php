
	<?php
	abstract class Person {
		public $obj = "người";
		public $name, $age, $address;

		function __construct(){
			echo "Khởi tạo đối tượng ".$this->obj. "<br>";
		}
		abstract function display();
		function __destruct(){
			echo "Đang hủy đối tượng ".$this->obj. "<br>";
		}
		public function getName() {
			return $this->name;
		}	
		public function setName($name) {
			$this->name = $name;
		}
		public function getAddress() {
			return $this->address;
		}
		public function setAddress($address) {
			$this->address = $address;
		}
		public function getAge() {
			return $this->age;
		}
		public function setAge($age) {
			$this->age = $age;
		}
		
		
	}


	class Student extends Person {

		private $class;

		function __construct() {
			$this->obj = "Sinh viên";
			parent::__construct();
		}

		function display() {
			echo "Họ tên: ".$this->name."<br>";
			echo "Tuổi: ".$this->age."<br>";
			echo "Địa chỉ: ".$this->address."<br>";
			echo "Lớp: ".$this->class."<br>";
		}

		function __destruct(){
			$this->obj = "Sinh viên";
			parent::__destruct();
		}

		public function getClass() {
			return $this->class;
		}
		public function setClass($class) {
			$this->class = $class;
		}
	}

	class Teacher extends Person {

		private $subject;

		function __construct() {
			$this->obj = "Giáo viên";
			parent::__construct();
		}

		function display() {
			echo "Họ tên: ".$this->name."<br>";
			echo "Tuổi: ".$this->age."<br>";
			echo "Địa chỉ: ".$this->address."<br>";
			echo "Dạy môn: ".$this->subject."<br>";
		}

		function __destruct(){
			$this->obj = "Giáo viên";
			parent::__destruct();
		}

		public function getSubject() {
			return $this->score;
		}
		public function setSubject($subject) {
			$this->subject = $subject;
		}
	}

	

?>
