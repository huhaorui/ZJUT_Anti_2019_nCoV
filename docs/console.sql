create view view_student as
select collage.name collage, major.name major, class.name class, student.id, student.name, person_id
from collage,
     major,
     class,
     student
where (class.id, major.id, collage.id) = (student.class, class.major, major.collage);

create view view_teacher as
select collage.name collage, teacher.id, teacher.name, person_id
from collage,
     teacher
where (teacher.collage) = (collage.id);

create view view_teacher_student as
select id, name, person_id
from student
union
select id, name, person_id
from teacher;

create view view_collage as
select id id, name collage
from collage;

create view view_major as
select major.id id, collage.name collage, major.name major
from major,
     collage
where major.collage = collage.id;

create view view_class as
select class.id id, collage.name collage, major.name major, class.name class
from class,
     major,
     collage
where (major.collage, class.major) = (collage.id, major.id);

create view view_student_full as
select collage.name      collage,
       major.name        major,
       class.name        class,
       student.id        id,
       student.name      name,
       student.person_id person_id
from student,
     class,
     major,
     collage
where (student.class, class.major, major.collage) = (class.id, major.id, collage.id);

create view view_health_info as
select student.id,
       student.name,
       student.person_id,
       health_info.if_danger_14 是否去过危险地区,
       health_info.if_abroad_14 是否出国,
       health_info.if_touch_illness 是否接触确诊或疑似病例,
       if(health_info.if_ill = 0, '是', '否') 是否确诊,
#        (cast(health_info.status as BINARY), 8)   健康状况
from health_info,
     student;

create view view_teacher_student_full as
select '学生' type, collage collage, major major, class class, id id, name name, person_id person_id
from view_student
union
select '教师' type, collage collage, '' major, '' class, id id, name name, person_id person_id
from view_teacher