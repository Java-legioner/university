package ua.ivashchuk.domain;

import javax.persistence.*;

@Entity
@Table(name = "applicants")
public class Applicant {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String firstName;
    private String lastName;
    private Integer age;
    private String email;
    private Faculty faculty;
    private Subject subject1;
    private Subject subject2;
    private Subject subject3;
    private Integer point1;
    private Integer point2;
    private Integer point3;
    private Integer GPA;

    @Lob
    private String encodedImage;

    public Applicant() {

    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getPoint1() {
        return point1;
    }

    public void setPoint1(Integer point1) {
        this.point1 = point1;
    }

    public Integer getPoint2() {
        return point2;
    }

    public void setPoint2(Integer point2) {
        this.point2 = point2;
    }

    public Integer getPoint3() {
        return point3;
    }

    public void setPoint3(Integer point3) {
        this.point3 = point3;
    }

    public Faculty getFaculty() {
        return faculty;
    }

    public void setFaculty(Faculty faculty) {
        this.faculty = faculty;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEncodedImage() {
        return encodedImage;
    }

    public void setEncodedImage(String encodedImage) {
        this.encodedImage = encodedImage;
    }

    public Subject getSubject1() {
        return subject1;
    }

    public void setSubject1(Subject subject1) {
        this.subject1 = subject1;
    }

    public Subject getSubject2() {
        return subject2;
    }

    public void setSubject2(Subject subject2) {
        this.subject2 = subject2;
    }

    public Subject getSubject3() {
        return subject3;
    }

    public void setSubject3(Subject subject3) {
        this.subject3 = subject3;
    }

    public Integer getGPA() {
        return GPA;
    }

    public void setGPA(Integer GPA) {
        this.GPA = GPA;
    }
}



