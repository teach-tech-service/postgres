SELECT
  komputery.nazwa,
  system_op.nazwa,
  komputery.system_op,
  sl_org.nazwa
FROM
  komputery
  INNER JOIN system_op ON komputery.system_op = system_op.id
  INNER JOIN sl_org ON komputery.lokalizacja = sl_org.id;