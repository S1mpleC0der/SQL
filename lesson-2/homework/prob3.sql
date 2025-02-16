CREATE TABLE photos(
    id INT IDENTITY(1,1) PRIMARY KEY,
    photo VARBINARY(MAX),
);

INSERT INTO photos(photo)
SELECT BulkColumn
FROM OPENROWSET(BULK 'C:\Users\hp computers\Desktop\miracl tilla png.png', SINGLE_BLOB) as img;
