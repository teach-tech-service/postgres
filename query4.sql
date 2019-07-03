SELECT
  id AS Identyfikator,
  login AS Login,
  concat(name, ' : ', funkcja) AS "Imie i nazwisko z stanowiskiem"
FROM
  users;