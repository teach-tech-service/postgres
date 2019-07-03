CREATE TYPE arch AS ENUM('x32', 'x64');
CREATE TABLE system_op (
  id serial NOT NULL,
  nazwa character varying(150) NOT NULL,
  architektura arch NOT NULL,
  CONSTRAINT system_op_pkey PRIMARY KEY (id)
);
CREATE TABLE statusy (
  id serial NOT NULL,
  opis character varying(15) NOT NULL,
  CONSTRAINT statusy_pkey PRIMARY KEY (id)
);
CREATE TABLE kategoria (
  id serial NOT NULL,
  opis character varying(50) NOT NULL,
  CONSTRAINT Kategoria_pkey PRIMARY KEY (id)
);
CREATE TABLE sl_org (
  id serial NOT NULL,
  nazwa character varying(150) NOT NULL,
  CONSTRAINT sl_org_pkey PRIMARY KEY (id)
);
CREATE TABLE komputery (
  id serial NOT NULL,
  nazwa character varying(150) NOT NULL,
  lokalizacja integer NOT NULL,
  system_op integer NOT NULL,
  system_op2 integer,
  nr_inw character varying(30) NOT NULL,
  CONSTRAINT komputery_pkey PRIMARY KEY (id),
  CONSTRAINT fk_komputery_system_op FOREIGN KEY (system_op) REFERENCES system_op (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_komputery_system_op2 FOREIGN KEY (system_op2) REFERENCES system_op (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_komputery_sl_org FOREIGN KEY (lokalizacja) REFERENCES sl_org (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE users (
  id serial NOT NULL,
  login character varying(50) NOT NULL,
  password character varying(30) NOT NULL,
  name character varying(250) NOT NULL,
  komorka integer NOT NULL,
  funkcja character varying(150),
  CONSTRAINT users_pkey PRIMARY KEY (id),
  CONSTRAINT fk_users_sl_org FOREIGN KEY (komorka) REFERENCES sl_org (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE uprawnienia (
  id serial NOT NULL,
  uzytkownik integer NOT NULL,
  administracja character varying(1) NOT NULL,
  kon_kier character varying(1) NOT NULL,
  kier_help character varying(1) NOT NULL,
  raporty character varying(1) NOT NULL,
  CONSTRAINT uprawnienia_pkey PRIMARY KEY (id),
  CONSTRAINT fk_uprawnienia_users FOREIGN KEY (uzytkownik) REFERENCES users (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE upr_zgl (
  user_id integer NOT NULL,
  kategoria_id integer NOT NULL,
  CONSTRAINT upr_zgl_pkey PRIMARY KEY (user_id, kategoria_id),
  CONSTRAINT fk_upr_zgl_kategoria FOREIGN KEY (kategoria_id) REFERENCES kategoria (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_upr_zgl_users FOREIGN KEY (user_id) REFERENCES users (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE zgloszenie (
  id serial NOT NULL,
  zglaszajacy integer NOT NULL,
  kategoria integer NOT NULL,
  komputer integer,
  status integer,
  odpowiedzialny integer,
  data_zgloszenia timestamp(2) without time zone,
  termin_rozwiazania timestamp(2) without time zone,
  data_rozwiazania timestamp(2) without time zone,
  opis character varying(250) NOT NULL,
  wyjasnienie character varying(250),
  CONSTRAINT zgloszenie_pkey PRIMARY KEY (id),
  CONSTRAINT fk_zgloszenie_kategoria FOREIGN KEY (kategoria) REFERENCES kategoria (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_zgloszenie_komputery FOREIGN KEY (komputer) REFERENCES komputery (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_zgloszenie_statusy FOREIGN KEY (status) REFERENCES statusy (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_zgloszenie_user_02 FOREIGN KEY (odpowiedzialny) REFERENCES users (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_zgloszenie_users_01 FOREIGN KEY (zglaszajacy) REFERENCES users (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
insert into
  system_op (nazwa, architektura)
values
  ('Windows 7', 'x32');
insert into
  system_op (nazwa, architektura)
values
  ('Windows 8', 'x32');
insert into
  system_op (nazwa, architektura)
values
  ('Windows 10', 'x32');
insert into
  system_op (nazwa, architektura)
values
  ('Windows 7', 'x64');
insert into
  system_op (nazwa, architektura)
values
  ('Windows 8', 'x64');
insert into
  system_op (nazwa, architektura)
values
  ('Windows 10', 'x64');
insert into
  system_op (nazwa, architektura)
values
  ('Fedora 24', 'x32');
insert into
  system_op (nazwa, architektura)
values
  ('Fedora 25', 'x32');
insert into
  system_op (nazwa, architektura)
values
  ('Fedora 24', 'x64');
insert into
  system_op (nazwa, architektura)
values
  ('Fedora 25', 'x64');
insert into
  statusy (opis)
values('Nowe');
insert into
  statusy (opis)
values('Przypisane');
insert into
  statusy (opis)
values('W realizacji');
insert into
  statusy (opis)
values('Zamrożone');
insert into
  statusy (opis)
values('Zamknięte');
insert into
  kategoria (opis)
values('helpdesk');
insert into
  kategoria (opis)
values('serwis');
insert into
  kategoria (opis)
values('intranet');
insert into
  kategoria (opis)
values('ERP');
insert into
  sl_org (nazwa)
values('Kadry');
insert into
  sl_org (nazwa)
values('Finanse');
insert into
  sl_org (nazwa)
values('Płace');
insert into
  sl_org (nazwa)
values('Handlowy');
insert into
  sl_org (nazwa)
values('IT');
insert into
  sl_org (nazwa)
values('Gospodarczy');
commit;
insert into
  komputery (nazwa, lokalizacja, system_op, nr_inw)
values('Kadry1', '1', '2', '46-68-100');
insert into
  komputery (nazwa, lokalizacja, system_op, nr_inw)
values('Kadry2', '1', '2', '46-68-101');
insert into
  komputery (nazwa, lokalizacja, system_op, nr_inw)
values('Place1', '3', '4', '46-68-102');
insert into
  komputery (nazwa, lokalizacja, system_op, nr_inw)
values('Place2', '3', '4', '46-68-103');
insert into
  komputery (nazwa, lokalizacja, system_op, nr_inw)
values('Fin1', '2', '4', '46-68-104');
insert into
  komputery (nazwa, lokalizacja, system_op, nr_inw)
values('Fin2', '2', '4', '46-68-105');
insert into
  komputery (nazwa, lokalizacja, system_op, nr_inw)
values('Fin3', '2', '4', '46-68-106');
insert into
  komputery (nazwa, lokalizacja, system_op, nr_inw)
values('Handl1', '4', '6', '46-68-107');
insert into
  komputery (nazwa, lokalizacja, system_op, nr_inw)
values('Handl2', '4', '4', '46-68-108');
insert into
  komputery (nazwa, lokalizacja, system_op, nr_inw)
values('Handl3', '4', '6', '46-68-109');
insert into
  komputery (nazwa, lokalizacja, system_op, nr_inw)
values('Handl4', '4', '3', '46-68-110');
insert into
  komputery (nazwa, lokalizacja, system_op, nr_inw)
values('Handl5', '4', '5', '46-68-111');
insert into
  komputery (nazwa, lokalizacja, system_op, nr_inw)
values('Handl6', '4', '6', '46-68-112');
insert into
  komputery (nazwa, lokalizacja, system_op, nr_inw)
values('Gosp1', '6', '4', '46-68-113');
insert into
  komputery (nazwa, lokalizacja, system_op, nr_inw)
values('Gosp2', '6', '3', '46-68-114');
insert into
  komputery (nazwa, lokalizacja, system_op, nr_inw)
values('Gosp3', '6', '6', '46-68-115');
insert into
  komputery (
    nazwa,
    lokalizacja,
    system_op,
    system_op2,
    nr_inw
  )
values('IT1', '5', '10', '1', '46-68-116');
insert into
  komputery (
    nazwa,
    lokalizacja,
    system_op,
    system_op2,
    nr_inw
  )
values('IT2', '5', '7', '2', '46-68-117');
insert into
  komputery (
    nazwa,
    lokalizacja,
    system_op,
    system_op2,
    nr_inw
  )
values('IT3', '5', '1', '10', '46-68-118');
insert into
  users (login, password, name, komorka, funkcja)
values(
    'a_wasilewski',
    '9LHsWR7X',
    'Adrian Wasilewski',
    '1',
    'Kierownik'
  );
insert into
  users (login, password, name, komorka, funkcja)
values(
    'g_kolodziejczyk',
    'kJ9huZUx',
    'Gabriel Kołodziejczyk',
    '1',
    null
  );
insert into
  users (login, password, name, komorka, funkcja)
values('r_madej', 'kcQggq4C', 'RafałMadej', '2', null);
insert into
  users (login, password, name, komorka, funkcja)
values(
    'l_szewczyk',
    'tZWLx8u6',
    'Lena Szewczyk',
    '2',
    'Kierownik'
  );
insert into
  users (login, password, name, komorka, funkcja)
values(
    'k_wojtowicz',
    'kCXGUu6D',
    'Kornelia Wójtowicz',
    '3',
    'Kierownik'
  );
insert into
  users (login, password, name, komorka, funkcja)
values(
    'a_chojnacki',
    'DEny5FwP',
    'Andrzej Chojnacki',
    '3',
    null
  );
insert into
  users (login, password, name, komorka, funkcja)
values(
    'a_michalska',
    'jLwZBY3u',
    'Aleksandra Michalska',
    '5',
    'Kierownik'
  );
insert into
  users (login, password, name, komorka, funkcja)
values(
    'm_jankowska',
    'qqFnXzSG',
    'mArta Jankowska',
    '5',
    null
  );
insert into
  users (login, password, name, komorka, funkcja)
values(
    'c_jankowski',
    'BgPVakZe',
    'Cezary Jankowski ',
    '5',
    null
  );
insert into
  users (login, password, name, komorka, funkcja)
values(
    'w_zielinska',
    'qMcUT89B',
    'Wiktoria Zielińska ',
    '6',
    null
  );
insert into
  users (login, password, name, komorka, funkcja)
values(
    'p_witkowski',
    'k63nvvgk',
    'Piotr Witkowski ',
    '6',
    'Kierownik'
  );
insert into
  users (login, password, name, komorka, funkcja)
values(
    'k_orlowski',
    'kn7GmqPo',
    'Kacper Orłowski',
    '6',
    null
  );
insert into
  users (login, password, name, komorka, funkcja)
values(
    'm_tomczak',
    '64JFNakD',
    'marta Tomczak',
    '4',
    'Kierownik'
  );
insert into
  users (login, password, name, komorka, funkcja)
values(
    'm_zawadzka',
    'oWXFvxHe',
    'Marta Zawadzka',
    '4',
    null
  );
insert into
  users (login, password, name, komorka, funkcja)
values(
    'm_wojciechowska',
    '3aZW6GGP',
    'MARTA Wojciechowska ',
    '4',
    null
  );
insert into
  users (login, password, name, komorka, funkcja)
values(
    'w_jakubowska',
    'tdWe4c2y',
    'Wiktoria Jakubowska',
    '4',
    null
  );
insert into
  users (login, password, name, komorka, funkcja)
values(
    's_nawrocki',
    'FbDTKoXx',
    'Stanisław Nawrocki',
    '4',
    null
  );
insert into
  users (login, password, name, komorka, funkcja)
values('m_lis', 'KmDEhLkJ', 'Mikołaj Lis ', '4', null);
insert into
  users (login, password, name, komorka, funkcja)
values('m_wilk', 'nK7RRd7J', 'Marta Wilk', '4', null);
insert into
  users (login, password, name, komorka, funkcja)
values(
    'k_stepien',
    'Ruok6Phb',
    'Katarzyna Stępień',
    '4',
    null
  );
insert into
  users (login, password, name, komorka, funkcja)
values(
    'k_kwiatkowska',
    'qnvAaSyk',
    'Kinga Kwiatkowska',
    '4',
    null
  );
insert into
  users (login, password, name, komorka, funkcja)
values(
    'p_tomczyk',
    'CBpkN8uz',
    'Paulina Tomczyk',
    '4',
    null
  );
insert into
  users (login, password, name, komorka, funkcja)
values(
    'p_tomczyk',
    'CBpkN8uz',
    'Paulina Tomczyk',
    '4',
    null
  );
commit;
insert into
  uprawnienia (
    uzytkownik,
    administracja,
    kon_kier,
    kier_help,
    raporty
  )
values
  ('1', 'N', 'T', 'N', 'T');
insert into
  uprawnienia (
    uzytkownik,
    administracja,
    kon_kier,
    kier_help,
    raporty
  )
values
  ('2', 'N', 'N', 'N', 'N');
insert into
  uprawnienia (
    uzytkownik,
    administracja,
    kon_kier,
    kier_help,
    raporty
  )
values
  ('3', 'N', 'N', 'N', 'N');
insert into
  uprawnienia (
    uzytkownik,
    administracja,
    kon_kier,
    kier_help,
    raporty
  )
values
  ('4', 'N', 'T', 'N', 'T');
insert into
  uprawnienia (
    uzytkownik,
    administracja,
    kon_kier,
    kier_help,
    raporty
  )
values
  ('5', 'N', 'T', 'N', 'T');
insert into
  uprawnienia (
    uzytkownik,
    administracja,
    kon_kier,
    kier_help,
    raporty
  )
values
  ('6', 'N', 'N', 'N', 'N');
insert into
  uprawnienia (
    uzytkownik,
    administracja,
    kon_kier,
    kier_help,
    raporty
  )
values
  ('7', 'T', 'T', 'T', 'T');
insert into
  uprawnienia (
    uzytkownik,
    administracja,
    kon_kier,
    kier_help,
    raporty
  )
values
  ('8', 'T', 'N', 'N', 'N');
insert into
  uprawnienia (
    uzytkownik,
    administracja,
    kon_kier,
    kier_help,
    raporty
  )
values
  ('9', 'T', 'N', 'N', 'N');
insert into
  uprawnienia (
    uzytkownik,
    administracja,
    kon_kier,
    kier_help,
    raporty
  )
values
  ('10', 'N', 'N', 'N', 'N');
insert into
  uprawnienia (
    uzytkownik,
    administracja,
    kon_kier,
    kier_help,
    raporty
  )
values
  ('11', 'N', 'T', 'N', 'T');
insert into
  uprawnienia (
    uzytkownik,
    administracja,
    kon_kier,
    kier_help,
    raporty
  )
values
  ('12', 'N', 'N', 'N', 'N');
insert into
  uprawnienia (
    uzytkownik,
    administracja,
    kon_kier,
    kier_help,
    raporty
  )
values
  ('13', 'N', 'T', 'N', 'T');
insert into
  uprawnienia (
    uzytkownik,
    administracja,
    kon_kier,
    kier_help,
    raporty
  )
values
  ('14', 'N', 'N', 'N', 'N');
insert into
  uprawnienia (
    uzytkownik,
    administracja,
    kon_kier,
    kier_help,
    raporty
  )
values
  ('15', 'N', 'N', 'N', 'N');
insert into
  uprawnienia (
    uzytkownik,
    administracja,
    kon_kier,
    kier_help,
    raporty
  )
values
  ('16', 'N', 'N', 'N', 'N');
insert into
  uprawnienia (
    uzytkownik,
    administracja,
    kon_kier,
    kier_help,
    raporty
  )
values
  ('17', 'N', 'N', 'N', 'N');
insert into
  uprawnienia (
    uzytkownik,
    administracja,
    kon_kier,
    kier_help,
    raporty
  )
values
  ('18', 'N', 'N', 'N', 'N');
insert into
  uprawnienia (
    uzytkownik,
    administracja,
    kon_kier,
    kier_help,
    raporty
  )
values
  ('19', 'N', 'N', 'N', 'N');
insert into
  uprawnienia (
    uzytkownik,
    administracja,
    kon_kier,
    kier_help,
    raporty
  )
values
  ('20', 'N', 'N', 'N', 'N');
insert into
  uprawnienia (
    uzytkownik,
    administracja,
    kon_kier,
    kier_help,
    raporty
  )
values
  ('21', 'N', 'N', 'N', 'N');
insert into
  uprawnienia (
    uzytkownik,
    administracja,
    kon_kier,
    kier_help,
    raporty
  )
values
  ('22', 'N', 'N', 'N', 'N');
insert into
  upr_zgl
values('7', '1');
insert into
  upr_zgl
values('7', '2');
insert into
  upr_zgl
values('7', '3');
insert into
  upr_zgl
values('7', '4');
insert into
  upr_zgl
values('8', '1');
insert into
  upr_zgl
values('8', '2');
insert into
  upr_zgl
values('8', '3');
insert into
  upr_zgl
values('9', '1');
insert into
  upr_zgl
values('9', '2');
insert into
  upr_zgl
values('9', '3');
commit;
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '11',
    '4',
    '19',
    '5',
    '7',
    '2016-01-12 11:25',
    '2016-11-05',
    '2016-10-25 14:30',
    'Nie można zaksięgowaćrozchodu RW14-78/2016',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '5',
    '2',
    '1',
    '5',
    '8',
    '2016-01-13 13:40',
    '2016-01-15',
    '2016-01-17 09:15',
    'Nie działa drukarka w dziale Kadr',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '15',
    '1',
    '17',
    '5',
    '9',
    '2016-01-14 13:45',
    '2016-01-17',
    '2016-01-17 09:15',
    'Awaria komputera, nie można uruchomić',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '5',
    '3',
    null,
    '5',
    '9',
    '2016-01-19 13:50',
    '2016-01-19',
    '2016-02-20 15:45',
    'Klawiatura nie działa',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '11',
    '4',
    '3',
    '5',
    '9',
    '2016-01-25 13:55',
    '2016-01-28',
    '2016-01-29 09:05',
    'Nie można uruchomićexcela',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '2',
    '3',
    '6',
    '5',
    '8',
    '2016-02-02 14:00',
    '2016-02-02',
    '2016-02-19 08:15',
    'Proszęo dodanie nowego konta księgowego szczegóły w załaczeniu',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '15',
    '2',
    null,
    '5',
    '8',
    '2016-02-03 14:05',
    '2016-02-05',
    '2016-02-05 11:00',
    'Błędny numer kartoteki klienta',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '2',
    '4',
    '12',
    '5',
    '7',
    '2016-02-03 14:15',
    '2016-02-11',
    '2016-02-11 14:45',
    'Poproszęo przygotowanie nowego stanowiska dla działu handlowego',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '2',
    '1',
    '4',
    '5',
    '7',
    '2016-02-10 14:25',
    '2016-02-15',
    '2016-02-11 07:30',
    'Drukarka brudzi wydruki',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '11',
    '3',
    null,
    '5',
    '9',
    '2016-02-11 14:30',
    '2016-02-11',
    '2016-02-12 14:59',
    'Drukarka nie drukuje –zgłasza informacjęo zacięciu papieru.',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '13',
    '2',
    '5',
    '5',
    '9',
    '2016-03-11 14:15',
    '2016-03-11',
    '2016-03-11 11:10',
    'Proszęo połączenie danych klienta A z danymi klienta B',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '13',
    '4',
    '3',
    '5',
    '9',
    '2016-03-15 14:25',
    '2016-03-15',
    '2016-03-15 16:00',
    'Nie można zaksięgowaćrozchodu RW14-78/2016',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '13',
    '2',
    '6',
    '5',
    '8',
    '2016-03-21 14:30',
    '2016-03-21',
    '2016-02-28 11:15',
    'Nie działa drukarka w dziale Kadr',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '6',
    '1',
    '6',
    '5',
    '9',
    '2016-03-23 14:35',
    '2016-03-23',
    '2016-03-24 14:00',
    'Awaria komputera, nie można uruchomić',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '6',
    '3',
    null,
    '5',
    '8',
    '2016-03-30 16:10',
    '2016-04-15',
    '2016-04-15 09:15',
    'Klawiatura nie działa',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '11',
    '4',
    null,
    '5',
    '9',
    '2016-04-18 12:45',
    '2016-04-19',
    '2016-04-19 08:00',
    'Nie można uruchomićexcela',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '21',
    '3',
    null,
    '5',
    '8',
    '2016-05-10 15:10',
    '2016-05-10',
    '2016-05-10 15:15',
    'Proszęo dodanie nowego konta księgowego szczegóły w załaczeniu',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '21',
    '2',
    null,
    '5',
    '8',
    '2016-05-17 15:15',
    '2016-05-17',
    '2016-05-17 15:54',
    'Błędny numer kartoteki klienta',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '22',
    '4',
    null,
    '5',
    '8',
    '2016-06-01 15:20',
    '2016-06-15',
    '2016-06-16 13:30',
    'Poproszęo przygotowanie nowego stanowiska dla działu handlowego',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '21',
    '1',
    '3',
    '5',
    '8',
    '2016-06-15 15:25',
    '2016-06-15',
    '2016-06-19 14:15',
    'Drukarka brudzi wydruki',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '11',
    '2',
    '4',
    '5',
    '9',
    '2016-06-22 15:30',
    '2016-08-19',
    '2016-08-19 12:05',
    'Drukarka nie drukuje –zgłasza informacjęo zacięciu papieru.',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '21',
    '1',
    '5',
    '5',
    '9',
    '2016-06-28 15:35',
    '2016-06-29',
    '2016-06-29 04:00',
    'Proszęo połączenie danych klienta A z danymi klienta B',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '2',
    '3',
    null,
    '5',
    '8',
    '2016-07-15 14:05',
    '2016-07-15',
    '2016-07-16 08:30',
    'Nie można zaksięgowaćrozchodu RW14-78/2016',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '12',
    '4',
    '9',
    '5',
    '7',
    '2016-07-27 14:15',
    '2016-07-27',
    '2016-07-29 20:15',
    'Nie działa drukarka w dziale Kadr',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '22',
    '3',
    '4',
    '5',
    '7',
    '2016-08-03 14:25',
    '2016-08-05',
    '2016-08-05 11:54',
    'Awaria komputera, nie można uruchomić',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '21',
    '2',
    '1',
    '5',
    '7',
    '2016-08-08 14:30',
    '2016-09-01',
    '2016-09-15 14:30',
    'Klawiatura nie działa',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '22',
    '4',
    '7',
    '5',
    '9',
    '2016-08-19 14:35',
    '2016-08-19',
    '2016-08-20 14:15',
    'Nie można uruchomićexcela',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '21',
    '1',
    null,
    '5',
    '8',
    '2016-08-24 16:10',
    '2016-08-26',
    '2016-08-26 14:25',
    'Proszęo dodanie nowego konta księgowego szczegóły w załaczeniu',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '15',
    '2',
    '16',
    '5',
    '7',
    '2016-09-07 12:45',
    '2016-09-25',
    '2016-12-12 14:30',
    'Błędny numer kartoteki klienta',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '17',
    '1',
    '12',
    '5',
    '8',
    '2016-09-09 12:50',
    '2016-09-09',
    '2016-09-09 13:30',
    'Poproszęo przygotowanie nowego stanowiska dla działu handlowego',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '5',
    '3',
    '9',
    '5',
    '9',
    '2016-09-15 16:25',
    '2016-09-22',
    '2016-10-11 15:05',
    'Drukarka brudzi wydruki',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '17',
    '4',
    '19',
    '5',
    '8',
    '2016-09-19 16:30',
    '2016-09-19',
    '2016-09-19 17:00',
    'Drukarka nie drukuje –zgłasza informacjęo zacięciu papieru.',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '11',
    '3',
    '3',
    '5',
    '7',
    '2016-09-23 16:35',
    '2016-10-02',
    '2016-11-15 09:45',
    'Proszęo połączenie danych klienta A z danymi klienta B',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '14',
    '2',
    '5',
    '5',
    '9',
    '2016-09-30 16:40',
    '2016-09-30',
    '2016-09-30 17:15',
    'Nie można zaksięgowaćrozchodu RW14-78/2016',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '17',
    '4',
    '7',
    '5',
    '8',
    '2016-10-19 12:05',
    '2016-10-30',
    '2016-11-23 14:30',
    'Nie działa drukarka w dziale Kadr',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '13',
    '1',
    '2',
    '5',
    '7',
    '2016-11-07 12:10',
    '2016-11-09',
    '2016-11-09 14:35',
    'Awaria komputera, nie można uruchomić',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '12',
    '2',
    '17',
    '5',
    '7',
    '2016-11-24 12:15',
    '2016-11-25',
    '2016-11-27 16:10',
    'Klawiatura nie działa',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '18',
    '1',
    '14',
    '5',
    '7',
    '2016-11-29 12:20',
    '2016-11-30',
    '2016-12-13 12:45',
    'Nie można uruchomićexcela',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '11',
    '3',
    '3',
    '5',
    '8',
    '2016-12-09 12:25',
    '2017-01-04',
    '2016-12-24 12:50',
    'Proszęo dodanie nowego konta księgowego szczegóły w załaczeniu',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '4',
    '4',
    '6',
    '5',
    '9',
    '2016-12-19 12:30',
    '2016-12-19',
    '2016-12-19 13:55',
    'Błędny numer kartoteki klienta',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '4',
    '3',
    '7',
    '5',
    '9',
    '2016-12-23 12:35',
    '2016-12-23',
    '2016-12-23 14:00',
    'Poproszęo przygotowanie nowego stanowiska dla działu handlowego',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '3',
    '2',
    null,
    '5',
    '7',
    '2017-01-19 12:40',
    '2017-01-19',
    '2017-01-19 16:15',
    'Drukarka brudzi wydruki',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '12',
    '4',
    null,
    '5',
    '7',
    '2017-02-13 12:45',
    '2017-02-18',
    '2017-03-30 11:20',
    'Drukarka nie drukuje –zgłasza informacjęo zacięciu papieru.',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '13',
    '1',
    null,
    '5',
    '7',
    '2017-02-23 12:50',
    '2017-02-25',
    '2017-10-09 08:15',
    'Proszęo połączenie danych klienta A z danymi klienta B',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '3',
    '2',
    '5',
    '5',
    '8',
    '2017-03-15 15:00',
    '2017-03-15',
    '2017-03-15 15:05',
    'Nie można zaksięgowaćrozchodu RW14-78/2016',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '5',
    '1',
    '3',
    '5',
    '8',
    '2017-04-04 15:05',
    '2016-04-04',
    '2016-04-05 12:25',
    'Nie działa drukarka w dziale Kadr',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '4',
    '3',
    '6',
    '5',
    '9',
    '2017-04-05 15:10',
    '2017-01-08',
    '2017-05-15 12:30',
    'Awaria komputera, nie można uruchomić',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '3',
    '4',
    '9',
    '5',
    '8',
    '2017-04-06 15:15',
    '2017-04-06',
    '2017-04-06 12:35',
    'Klawiatura nie działa',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '12',
    '3',
    '12',
    '5',
    '8',
    '2017-04-11 11:30',
    '2016-04-12',
    '2016-04-12 12:40',
    'Nie można uruchomićexcela',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '16',
    '2',
    null,
    '5',
    '9',
    '2017-04-11 11:35',
    '2017-04-11',
    '2017-05-22 12:45',
    'Proszęo dodanie nowego konta księgowego szczegóły w załaczeniu',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '2',
    '4',
    '14',
    '5',
    '8',
    '2017-05-23 13:40',
    '2017-05-30',
    '2017-05-01 12:50',
    'Błędny numer kartoteki klienta',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '2',
    '1',
    '3',
    '5',
    '9',
    '2017-06-05 13:45',
    '2017-06-30',
    '2017-07-01 15:00',
    'Poproszęo przygotowanie nowego stanowiska dla działu handlowego',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '3',
    '2',
    '6',
    '5',
    '8',
    '2017-06-08 13:50',
    '2017-07-12',
    '2017-07-13 15:05',
    'Drukarka brudzi wydruki',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '16',
    '1',
    null,
    '5',
    '8',
    '2017-06-12 12:05',
    '2017-05-25',
    '2017-06-22 15:10',
    'Drukarka nie drukuje –zgłasza informacjęo zacięciu papieru.',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '12',
    '3',
    '12',
    '5',
    '9',
    '2017-06-21 12:10',
    '2017-06-22',
    '2017-06-22 15:15',
    'Proszęo połączenie danych klienta A z danymi klienta B',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '19',
    '4',
    '4',
    '5',
    '9',
    '2017-06-26 12:15',
    '2017-06-27',
    '2017-09-01 11:30',
    'Nie można zaksięgowaćrozchodu RW14-78/2016',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '16',
    '3',
    '9',
    '5',
    '9',
    '2017-07-03 11:25',
    '2017-07-03',
    '2017-07-05 11:35',
    'Nie działa drukarka w dziale Kadr',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '2',
    '2',
    '5',
    '5',
    '8',
    '2017-07-10 11:30',
    '2017-07-10',
    '2017-07-10 13:40',
    'Awaria komputera, nie można uruchomić',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '19',
    '4',
    null,
    '5',
    '8',
    '2017-07-20 11:35',
    '2017-07-21',
    '2017-07-21 13:45',
    'Klawiatura nie działa',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '19',
    '1',
    '6',
    '5',
    '8',
    '2017-08-01 11:50',
    '2017-08-10',
    '2017-09-11 13:50',
    'Nie można uruchomićexcela',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '12',
    '2',
    '17',
    '5',
    '7',
    '2017-08-17 12:40',
    '2017-08-17',
    '2017-08-18 12:05',
    'Proszęo dodanie nowego konta księgowego szczegóły w załaczeniu',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '1',
    '1',
    null,
    '5',
    '7',
    '2017-09-04 12:45',
    '2017-09-04',
    '2017-09-05 12:10',
    'Błędny numer kartoteki klienta',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '1',
    '3',
    '3',
    '5',
    '8',
    '2017-09-08 12:50',
    '2017-09-08',
    '2017-09-11 12:15',
    'Poproszęo przygotowanie nowego stanowiska dla działu handlowego',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '19',
    '4',
    '6',
    '5',
    '9',
    '2017-09-28 12:55',
    '2017-09-28',
    '2017-09-28 11:25',
    'Drukarka brudzi wydruki',
    'To jest wyjaśnienie'
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '13',
    '3',
    '11',
    '1',
    '9',
    '2017-09-26 11:08',
    null,
    null,
    'Nie działa drukarka w dziale Kadr',
    null
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '21',
    '2',
    null,
    '3',
    '8',
    '2017-09-27 16:05',
    '2017-10-02',
    null,
    'Awaria komputera, nie można uruchomić',
    null
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '5',
    '1',
    '9',
    '3',
    '7',
    '2017-09-30 23:09',
    '2017-10-02',
    null,
    'Klawiatura nie działa',
    null
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '6',
    '4',
    null,
    '1',
    '8',
    '2017-09-30 08:45',
    null,
    null,
    'Nie można uruchomićexcela',
    null
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '5',
    '1',
    '11',
    '1',
    '9',
    '2017-09-24 11:08',
    null,
    null,
    'Nie działa drukarka w dziale Kadr',
    null
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '21',
    '2',
    null,
    '3',
    '8',
    '2017-09-25 16:05',
    '2017-10-03',
    null,
    'Awaria komputera, nie można uruchomić',
    null
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '13',
    '3',
    '9',
    '3',
    '7',
    '2017-09-29 23:09',
    '2017-10-05',
    null,
    'Klawiatura nie działa',
    null
  );
insert into
  zgloszenie (
    zglaszajacy,
    kategoria,
    komputer,
    status,
    odpowiedzialny,
    data_zgloszenia,
    termin_rozwiazania,
    data_rozwiazania,
    opis,
    wyjasnienie
  )
values(
    '21',
    '2',
    null,
    '1',
    '8',
    '2017-09-28 08:45',
    null,
    null,
    'Nie można uruchomićexcela',
    null
  );
commit;
CREATE
  OR REPLACE VIEW "v_komputery" ("id", "nazwa", "komorka", "system") AS
select
  k.id,
  k.nazwa,
  s.nazwa as komorka,
  so.nazwa || ' - ' || so.architektura as system
from
  komputery k,
  sl_org s,
  system_op so
where
  k.lokalizacja = s.id
  and so.id = k.system_op;
CREATE
  OR REPLACE VIEW "v_zgloszenia" (
    "id",
    "zglaszajacy_id",
    "zglaszajacy",
    "komputer_id",
    "komputer",
    "system",
    "status",
    "status_id",
    "odpowiedzialny_id",
    "odpowiedzialny",
    "opis",
    "data_zgloszenia",
    "data_rozwiazania",
    "termin_rozwiazania",
    "wyjasnienie",
    "komorka_id",
    "komorka",
    "kategoria",
    "kategoria_id"
  ) AS
select
  z.id,
  u1.id as zglaszajacy_id,
  u1.name as zglaszajacy,
  c.id as komputer_id,
  c.nazwa as komputer,
  c.system,
  s.opis as status,
  s.status_id,
  z.odpowiedzialny as odpowiedzialny_id,
  u.name as odpowiedzialny,
  z.opis as opis,
  z.data_zgloszenia,
  z.data_rozwiazania,
  z.termin_rozwiazania,
  z.wyjasnienie,
  slo.id as komorka_id,
  slo.nazwa as komorka,
  k.opis as kategoria,
  k.id as kategoria_id
from
  users u1,
  kategoria k,
  v_komputery c
  right outer join zgloszenie z on (c.id = z.komputer),
  sl_org slo,
  (
    select
      z.id as id,
      s.opis as opis,
      s.id as status_id
    from
      zgloszenie z
      right outer join statusy s on (z.status = s.id)
  ) s,
  (
    select
      z.id as id,
      u.name as name
    from
      users u
      right outer join zgloszenie z on (u.id = z.odpowiedzialny)
  ) u
where
  z.zglaszajacy = u1.id
  and k.id = z.kategoria
  and slo.id = u1.komorka
  and s.id = z.id
  and u.id = z.id;
create
  or replace view v_komp_uz as
select
  us.nazwa,
  us.il_uz,
  komp.il_komp
from
  (
    select
      s.nazwa,
      count(s.id) as il_uz
    from
      users u,
      sl_org s
    where
      u.komorka = s.id
    group by
      s.nazwa
  ) us,
  (
    select
      s.nazwa,
      count(s.id) as il_komp
    from
      komputery k,
      sl_org s
    where
      s.id = k.lokalizacja
    group by
      s.nazwa
  ) komp
where
  us.nazwa = komp.nazwa;


create language plpgsql;