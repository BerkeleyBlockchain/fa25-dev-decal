contract AttendanceTest {
   Attendance attendance;


   /// Called before each test
   function beforeEach() public {
       attendance = new Attendance();
   }


   /// Test: contract starts with zero students
   function testInitialStudentCountIsZero() public {
       Assert.equal(attendance.getNumberOfStudents(), uint(0), "Initial student count should be zero");
   }


   /// Test: add one student
   function testAddSingleStudent() public {
       attendance.addStudent("Alice");


       uint count = attendance.getNumberOfStudents();
       Assert.equal(count, uint(1), "Student count should be 1 after adding Alice");


       string[] memory names = attendance.getStudentNames();
       Assert.equal(names.length, uint(1), "Names array length should be 1");
       Assert.equal(names[0], "Alice", "First student should be Alice");
   }


   /// Test: add multiple students
   function testAddMultipleStudents() public {
       attendance.addStudent("Alice");
       attendance.addStudent("Bob");
       attendance.addStudent("Charlie");


       uint count = attendance.getNumberOfStudents();
       Assert.equal(count, uint(3), "Student count should be 3 after adding 3 students");


       string[] memory names = attendance.getStudentNames();
       Assert.equal(names[0], "Alice", "First student should be Alice");
       Assert.equal(names[1], "Bob", "Second student should be Bob");
       Assert.equal(names[2], "Charlie", "Third student should be Charlie");
   }
}
