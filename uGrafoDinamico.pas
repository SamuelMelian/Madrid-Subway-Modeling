unit uGrafoDinamico;

{$mode ObjFPC}{$H+}

interface

uses
  uNodoG, uListaAdy, uElemento, uAdy;

TYPE
  TGrafo = ^TNodoGrafo;
  TNodoGrafo = RECORD
    info : TNodoG; //TElementoNodo
    sig : ^TNodoGrafo;
  END;

PROCEDURE CrearGrafoVacio(VAR g : TGrafo);
PROCEDURE InsertarNodo(VAR g : TGrafo; e : TElemento);
PROCEDURE InsertarAristas(VAR g : TGrafo; n1, n2 : TElemento; peso : integer);
PROCEDURE InsertarAristasDirigidas(VAR g : TGrafo; n1, n2 : TElemento; peso : integer);
FUNCTION  EsGrafoVacio(VAR g : TGrafo) : Boolean;
PROCEDURE EstacionRepetida(VAR g : TGrafo; VAR e1 : TElemento; VAR encontrado : boolean);
PROCEDURE BuscarEstacion(VAR g : TGrafo; id : TElementoID);

implementation

PROCEDURE CrearGrafoVacio(VAR g : TGrafo);
BEGIN
  g := NIL;
END;

FUNCTION EsGrafoVacio(VAR g : TGrafo) : Boolean;
BEGIN
  EsGrafoVacio := g = NIL;
end;

PROCEDURE InsertarNodo(VAR g : TGrafo; e : TElemento);
VAR
  aux : ^TNodoGrafo;
BEGIN
  new(aux);
  asignarNodoG(aux^.info, e);
  aux^.sig := g;
  g := aux;
END;

PROCEDURE InsertarAristasDirigidas(VAR g : TGrafo; n1, n2 : TElemento; peso : integer);
VAR
  aux : ^TNodoGrafo;
  ady : TListaAdy;
  id : TElementoID;
  eAdy : TAdy;
BEGIN
  aux := g;
  while not EsGrafoVacio(aux) and not EsIgualNodoG(aux^.info, n1) do
    aux := aux^.sig;
  if not EsGrafoVacio(aux) then
  begin
    {adyacencia(aux^.info, ady);}
    sacarID(n2, id);
    crearElementoAdy(eAdy, id, peso);
    construirNodoG(aux^.info, eAdy); //??????????????????????
  end;
END;

PROCEDURE InsertarAristas(VAR g : TGrafo; n1, n2 : TElemento; peso : integer);
BEGIN
  InsertarAristasDirigidas(g, n1, n2, peso);
  InsertarAristasDirigidas(g, n2, n1, peso);
END;

PROCEDURE EstacionRepetida(VAR g : TGrafo; VAR e1 : TElemento; VAR encontrado : boolean);
VAR
  aux : ^TNodoGrafo;
BEGIN
  encontrado := false;
  aux := g;
  while not EsGrafoVacio(aux) and not EsIgualNodoG(aux^.info, e1) do
  begin
    aux := aux^.sig
  end;
  if not EsGrafoVacio(aux) then
  begin
    encontrado := true;
    UnionNodoG(aux^.info, e1);
  end;
end;

PROCEDURE BuscarEstacion(VAR g : TGrafo; id : TElementoID);
VAR
  aux : ^TNodoGrafo;
  e : TElemento;
BEGIN
  aux := g;
  crearElemento(id, 1, e);
  while not EsGrafoVacio(aux) and not EsIgualNodoG(aux^.info, e) do
    aux := aux^.sig;
  if not EsGrafoVacio(aux) then
    MostrarNodoG(aux^.info)
  else
    writeln('No existe ninguna estacion con ese nombre');
end;

{PROCEDURE BorrarNodo(VAR g : TGrafo; e : TElemento);
VAR
  aux1, aux2 : ^TNodoGrafo;
BEGIN
  aux := g;
  while not EsGrafoVacio(aux) do
  begin
    if not EsIgualNodoG(aux^.info, e) then
      BorrarElementoAdy(aux^.info, e)
    else
      destruirAdy(aux^.info);
    aux := aux^.sig;
  end;
  BorrarElemento(g, e);  //Igual implementado que la lista

end;}

end.

