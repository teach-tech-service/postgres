SELECT
  id as "Id zgłoszenia",
  data_zgloszenia as "Data zgłoszenia",
  termin_rozwiazania as "Termin rozwiązania",
  data_rozwiazania as "Data rozwiązania",
  CONCAT(opis, ' wyjasnienie: ', wyjasnienie) as "Opis z wyjaśnieniem",
  DATE_PART(
    'day',
    data_rozwiazania :: timestamp - termin_rozwiazania :: timestamp
  ) as "Opoznienie"
FROM
  zgloszenie;