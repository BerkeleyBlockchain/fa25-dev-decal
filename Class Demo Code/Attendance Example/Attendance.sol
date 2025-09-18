contract Attendance {
   // Dynamic array of student names
   string[] private studentNames;
  
   // Return number of students currently stored
   function getNumberOfStudents() public view returns (uint) {
       return studentNames.length;
   }


   // Return the full list of student names
   function getStudentNames() public view returns (string[] memory) {
       return studentNames;
   }


   // Append a new student name and update the count automatically
   function addStudent(string memory name) public {
       studentNames.push(name);
   }
}
