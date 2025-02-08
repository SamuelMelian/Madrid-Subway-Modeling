unit uConjunto;


interface

USES
  uElementoConjunto;

TYPE
  TArray = ARRAY [TElementoConjunto] OF Boolean;
  TConjunto = RECORD
    info : TArray;
    num : integer;
  END;

PROCEDURE CrearConjuntoVacio(VAR c : TConjunto);
FUNCTION EsConjuntoCompleto(c : TConjunto) : Boolean;
{FUNCTION EsConjuntoIgual(VAR c1, c2 : TConjunto) : Boolean; }
PROCEDURE Poner(VAR c : TConjunto; e : TElementoConjunto);
PROCEDURE Quitar(VAR c : TConjunto; e : TElementoConjunto);
FUNCTION  Pertenece(VAR c : TConjunto; e : TElementoConjunto) : Boolean;
PROCEDURE Union(VAR u : TConjunto; VAR c1, c2 : TConjunto);
PROCEDURE Interseccion(VAR i : TConjunto; VAR c1, c2 : TConjunto);
PROCEDURE Diferencia(VAR d : TConjunto; VAR c1, c2 : TConjunto);
// PROCEDURE ConjuntoABolsa(VAR c : TConjunto; VAR b : TBolsa);
PROCEDURE AsignarConjunto(VAR c1 : TConjunto; VAR c2 : TConjunto);
FUNCTION Cantidad(c : TConjunto) : Integer;
PROCEDURE MostrarConjunto(c : TConjunto);

implementation

  PROCEDURE CrearConjuntoVacio(VAR c : TConjunto);
  VAR
    i : TElementoConjunto;
  BEGIN
    c.num := 0;
    for i := INI to FIN do  //En principio habría que asignar pero como sabemos que son ordinales podemos hacerlo
      c.info[i] := false;
  END;

  FUNCTION EsConjuntoCompleto(c : TConjunto) : Boolean;
  BEGIN
    EsConjuntoCompleto := c.num = length(c.info);
  END;

 FUNCTION Cantidad(c : TConjunto) : Integer;
  BEGIN
    cantidad := c.num;
  END;

  {FUNCTION EsConjuntoIgual(VAR c1, c2 : TConjunto) : Boolean;
  BEGIN
    EsConjuntoIgual := c1.info = c2.info;
  END;}

  FUNCTION Pertenece(VAR c : TConjunto; e : TElementoConjunto) : Boolean;
  BEGIN
    Pertenece := c.info[e];
  END;

  PROCEDURE Poner(VAR c : TConjunto; e : TElementoConjunto);
  BEGIN
    if not (Pertenece(c, e)) then
    begin
      c.info[e] := true;  //Podríamos ponerlo fuera de la condición
      c.num := c.num + 1;
    end;
  END;

  PROCEDURE Quitar(VAR c : TConjunto; e : TElementoConjunto);
  BEGIN
    if Pertenece(c, e) then
    begin
      c.info[e] := false;  //Podríamos ponerlo fuera de la condición
      c.num := c.num - 1;
    end;
  END;

  PROCEDURE Union(VAR u : TConjunto; VAR c1, c2 : TConjunto);
  VAR
    indice : TElementoConjunto;
  BEGIN
    for indice := INI to FIN do
    if (not Pertenece(u, indice) and (c1.info[indice] or c2.info[indice])) then
    begin
      u.info[indice] := true;
      u.num := u.num + 1;
    end;
  END;

  PROCEDURE Interseccion(VAR i : TConjunto; VAR c1, c2 : TConjunto);
  VAR
    indice : TElementoConjunto;
  BEGIN
    for indice := INI to FIN do
    if (not Pertenece(i, indice)) and (c1.info[indice] and c2.info[indice]) then
    begin
      i.info[indice] := true;
      i.num := i.num + 1;
    end;
  END;

  PROCEDURE Diferencia(VAR d : TConjunto; VAR c1, c2 : TConjunto);
  VAR
    indice : TElementoConjunto;
  BEGIN
    for indice := INI to FIN do
    if (not Pertenece(d, indice)) and (c1.info[indice] and not c2.info[indice]) then
    begin
      d.info[indice] := true;
      d.num := d.num + 1;
    end;
  END;

  {PROCEDURE ConjuntoABolsa(VAR c : TConjunto; VAR b : TBolsa);
  VAR
    indice : TElementoConjunto;
  BEGIN
    for indice := INI to FIN do
      b[indice] := ord(c.info[indice]);
  END;}

  PROCEDURE AsignarConjunto(VAR c1 : TConjunto; VAR c2 : TConjunto);
  BEGIN
    c1 := c2;
  END;

  PROCEDURE MostrarConjunto(c : TConjunto);
  VAR
    i : TElementoConjunto;
  begin
    write('La estacion pertenece a las lineas: ');
    for i := INI to FIN do
    begin
      if c.info[i] then
        write(i, ' ');
    end;
    writeln;
  end;

end.
                                    
