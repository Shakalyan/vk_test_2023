-- TABLE INITIALIZATION

-- CREATE TABLE employees(
-- 	id UUID PRIMARY KEY,
-- 	username VARCHAR(32) UNIQUE NOT NULL,
--  password VARCHAR(255) NOT NULL,
-- 	full_name VARCHAR(255) NOT NULL
-- );

-- CREATE TABLE roles(
-- 	id SERIAL PRIMARY KEY,
-- 	name VARCHAR(255) UNIQUE NOT NULL
-- );

-- CREATE TABLE roles_mapping(
-- 	employee_id UUID,
-- 	role_id INT,
-- 	PRIMARY KEY (employee_id, role_id),
-- 	FOREIGN KEY (employee_id) REFERENCES employees(id),
-- 	FOREIGN KEY (role_id) REFERENCES roles(id)
-- );

-- CREATE TABLE categories(
-- 	id SERIAL PRIMARY KEY,
-- 	name VARCHAR(255) UNIQUE NOT NULL
-- );

-- CREATE TABLE tasks(
-- 	id UUID PRIMARY KEY,
-- 	name VARCHAR(32) UNIQUE NOT NULL,
-- 	category_id INT NOT NULL,
-- 	text_url VARCHAR(255) NOT NULL,
-- 	FOREIGN KEY (category_id) REFERENCES categories(id)
-- );

-- CREATE TABLE tasks_completions(
-- 	employee_id UUID,
-- 	task_id UUID,
-- 	PRIMARY KEY(employee_id, task_id),
-- 	FOREIGN KEY (employee_id) REFERENCES employees(id),
-- 	FOREIGN KEY (task_id) REFERENCES tasks(id)
-- );

-- TABLE FILLING

-- create extension if not exists "uuid-ossp";

-- INSERT INTO employees (id, username, password, full_name) VALUES
-- (uuid_generate_v4(), 'volkov_am', '$2a$10$up9XnvS/.c/YiVBNFm.Vue82.3OGmtHaX95tb.jdYa/DRGmwxJCfe', 'Волков Артём Максимович'),
-- (uuid_generate_v4(), 'berezin_ai', '$2a$10$AAi.Ofwj4SRJH4HsXSzZB.44FSXhnAJQBrcuPVUQVjxrTeOkqrtFS', 'Березин Артём Ибрагимович'),
-- (uuid_generate_v4(), 'ivanov_dk', '$2a$10$77H.gn8TNKeePYuumn2l5ePQStxAZP6V4izQXT.Eq4N0QgXHYOtSG', 'Иванов Дмитрий Константинович'),
-- (uuid_generate_v4(), 'filippova_at', '$2a$10$FQgJi0dGL3ao7zlGpDM2vuf3q95XiK.UXy2CgugRBbW3T2vOsnbM6', 'Филиппова Алёна Тимофеевна'),
-- (uuid_generate_v4(), 'petrova_aa', '$2a$10$uwQw9GuGuuiE5LevzrYoQOUAEmieNjnphcbWZietPYt7.7ayQ/ZEu', 'Петрова Арина Анатольевна'),
-- (uuid_generate_v4(), 'scherbakov_fs', '$2a$10$VpXCpL13Ovv71vkhpppTleUMA3Y1nCLnCtigklkneonJdqchpqk9m', 'Щербаков Фёдор Сергеевич'),
-- (uuid_generate_v4(), 'vasilieva_vya', '$2a$10$NISPluQcp/BDHPMsrozGRebZE5hGzS.v4NUMr48oERcpoo4KFlHiu', 'Васильева Варвара Ярославовна'),
-- (uuid_generate_v4(), 'hohlov_vm', '$2a$10$CRdusukmbPe/5QUlJy3wmO3C0VuU7.NujstpTg3EAQ6CDq4CCMG.2', 'Хохлов Владимир Макарович'),
-- (uuid_generate_v4(), 'filimonova_yaf', '$2a$10$d383MPUukyTRYqYxCXXn.OzshLYxYGkNOYwxQpKM8AF1Pg85uhFzW', 'Филимонова Ясмина Фёдоровна'),
-- (uuid_generate_v4(), 'vereschagina_ld', '$2a$10$oFhxkDbmxwCkwU/mAyTMmesuPUuxmyg8/YmgZm6.lyVtEo6c02s.i', 'Верещагина Лидия Демидовна')
-- (uuid_generate_v4(), 'admin', '$2a$10$6d9IcdCzUVXlx90RhtWmOupKkRhn2NxW5CYhG9/4mNltVMPEppl92', 'Админ');

-- INSERT INTO roles (name) VALUES
-- ('ROLE_USER'),
-- ('ROLE_ADMIN');

-- DO
-- $$
-- DECLARE
-- 	tmp RECORD;
-- BEGIN
-- 	FOR tmp IN SELECT * FROM employees 
-- 	LOOP
-- 		INSERT INTO roles_mapping (employee_id, role_id) VALUES
-- 		(tmp.id, (SELECT id FROM roles WHERE name = 'ROLE_USER'));
-- 	END LOOP;
-- END;
-- $$

-- INSERT INTO roles_mapping(employee_id, role_id) VALUES
-- ((SELECT id FROM employees WHERE username = 'admin'), (SELECT id FROM roles WHERE name = 'ROLE_USER')),
-- ((SELECT id FROM employees WHERE username = 'admin'), (SELECT id FROM roles WHERE name = 'ROLE_ADMIN'))

-- INSERT INTO categories (name) VALUES
-- ('Fishing'),
-- ('Vishing'),
-- ('Smishing');

-- INSERT INTO tasks (id, name, category_id, text_url) VALUES
-- (uuid_generate_v4(), 'Fishing1', 1, 'text-site/fishing/1'),
-- (uuid_generate_v4(), 'Fishing2', 1, 'text-site/fishing/2'),
-- (uuid_generate_v4(), 'Fishing3', 1, 'text-site/fishing/3'),
-- (uuid_generate_v4(), 'Fishing4', 1, 'text-site/fishing/4'),
-- (uuid_generate_v4(), 'Fishing5', 1, 'text-site/fishing/5'),
-- (uuid_generate_v4(), 'Vishing1', 2, 'text-site/vishing/1'),
-- (uuid_generate_v4(), 'Vishing2', 2, 'text-site/vishing/2'),
-- (uuid_generate_v4(), 'Vishing3', 2, 'text-site/vishing/3'),
-- (uuid_generate_v4(), 'Vishing4', 2, 'text-site/vishing/4'),
-- (uuid_generate_v4(), 'Vishing5', 2, 'text-site/vishing/5'),
-- (uuid_generate_v4(), 'Smishing1', 3, 'text-site/smishing/1'),
-- (uuid_generate_v4(), 'Smishing2', 3, 'text-site/smishing/2'),
-- (uuid_generate_v4(), 'Smishing3', 3, 'text-site/smishing/3'),
-- (uuid_generate_v4(), 'Smishing4', 3, 'text-site/smishing/4'),
-- (uuid_generate_v4(), 'Smishing5', 3, 'text-site/smishing/5');

-- INSERT INTO tasks_completions(employee_id, task_id) VALUES
-- ((SELECT id FROM employees WHERE username = 'volkov_am'), (SELECT id FROM tasks WHERE name = 'Fishing1')),
-- ((SELECT id FROM employees WHERE username = 'volkov_am'), (SELECT id FROM tasks WHERE name = 'Fishing2')),
-- ((SELECT id FROM employees WHERE username = 'volkov_am'), (SELECT id FROM tasks WHERE name = 'Vishing1')),
-- ((SELECT id FROM employees WHERE username = 'volkov_am'), (SELECT id FROM tasks WHERE name = 'Smishing1')),

-- ((SELECT id FROM employees WHERE username = 'petrova_aa'), (SELECT id FROM tasks WHERE name = 'Fishing1')),
-- ((SELECT id FROM employees WHERE username = 'petrova_aa'), (SELECT id FROM tasks WHERE name = 'Fishing2')),
-- ((SELECT id FROM employees WHERE username = 'petrova_aa'), (SELECT id FROM tasks WHERE name = 'Fishing3')),

-- ((SELECT id FROM employees WHERE username = 'ivanov_dk'), (SELECT id FROM tasks WHERE name = 'Vishing1')),
-- ((SELECT id FROM employees WHERE username = 'ivanov_dk'), (SELECT id FROM tasks WHERE name = 'Vishing2')),
-- ((SELECT id FROM employees WHERE username = 'ivanov_dk'), (SELECT id FROM tasks WHERE name = 'Vishing3')),
-- ((SELECT id FROM employees WHERE username = 'ivanov_dk'), (SELECT id FROM tasks WHERE name = 'Smishing1')),

-- ((SELECT id FROM employees WHERE username = 'vereschagina_ld'), (SELECT id FROM tasks WHERE name = 'Smishing1')),
-- ((SELECT id FROM employees WHERE username = 'vereschagina_ld'), (SELECT id FROM tasks WHERE name = 'Smishing2')),
-- ((SELECT id FROM employees WHERE username = 'vereschagina_ld'), (SELECT id FROM tasks WHERE name = 'Smishing3')),
-- ((SELECT id FROM employees WHERE username = 'vereschagina_ld'), (SELECT id FROM tasks WHERE name = 'Smishing4')),
-- ((SELECT id FROM employees WHERE username = 'vereschagina_ld'), (SELECT id FROM tasks WHERE name = 'Fishing1'));

-- DROP ALL
-- DROP TABLE tasks_completions;
-- DROP TABLE tasks;
-- DROP TABLE categories;
-- DROP TABLE employees;

-- SELECT employee_id as employeeId, COUNT(*) as count
-- FROM tasks_completions
-- JOIN tasks on tasks.id = tasks_completions.task_id
-- WHERE category_id = 3
-- GROUP BY employee_id
-- ORDER BY count DESC;

