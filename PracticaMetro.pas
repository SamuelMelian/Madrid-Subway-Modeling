program PracticaMetro;

USES
  uGrafoDinamico, sysutils, uNodoG, uElemento;

VAR
  f : text;
  i : integer;
  g : TGrafo;
  estacion : string;

PROCEDURE ConstruirGrafo(VAR grafo : TGrafo; VAR fich : text; i : integer);
VAR
  estacion1, estacion2 : string;
  e1, e2, estacioncircular : TElemento;
  encontrado : boolean;
BEGIN
  readln(fich, estacion2);
  crearElemento(estacion2, i, e2);
  EstacionRepetida(grafo, e2, encontrado);
  if not encontrado then
    InsertarNodo(grafo, e2);
  if (i = 6) or (i = 12) then
    estacionCircular := e2;
  while not EOF(fich) do
  begin
    estacion1 := estacion2;
    asignar(e1, e2);
    readln(fich, estacion2);
    crearElemento(estacion2, i, e2);
    EstacionRepetida(grafo, e2, encontrado);
    if not encontrado then
      InsertarNodo(grafo, e2);
    insertarAristas(grafo, e1, e2, 1);
  end;
  if (i = 6) or (i = 12) then
    insertarAristas(g, e2, estacioncircular, 1);
END;

begin
  CrearGrafoVacio(g);
  for i := 1 to 12 do
  begin
    assign(f, concat('./L', IntToStr(i), '.txt'));
    {$I-}
    reset(f);
    {$I+}
    if ioresult = 0 then
      ConstruirGrafo(g, f, i);
    close(f);
  end;
  writeln('Escriba una estacion');
  readln(estacion);
  BuscarEstacion(g, estacion);
  readln;
end.

