create table category(
  id int;
  name varchar(80),
  description varchar(255),
  image_url varchar(100),
  isActive boolean,
  
  constraint pk_category_id primary key(id)

);