CREATE TABLE "public"."User" (
    id SERIAL PRIMARY KEY NOT NULL,
    username VARCHAR(255) NOT NULL,
    passwords VARCHAR(255) NOT NULL
);

CREATE TABLE "public"."Todos" (
    id SERIAL PRIMARY KEY NOT NULL,
    task VARCHAR(255) NOT NULL,
    taskStatus VARCHAR(255) NOT NULL,
    createdAt TIMESTAMP NOT NULL DEFAULT now(),
    updatedAt TIMESTAMP NOT NULL DEFAULT now(),
    userID INTEGER NOT NULL,
    FOREIGN KEY(userID) REFERENCES "public"."User"(id)
);
