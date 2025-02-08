unit uNodoG;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, uElemento, uListaAdy, uAdy;

TYPE
  TNodoG = RECORD
    nodo : TElemento;
    ady : TListaAdy;
  END;

PROCEDURE AsignarNodoG(VAR n : TNodoG; e : TElemento);
FUNCTION EsIgualNodoG(VAR n : TNodoG; e : TElemento) : Boolean;
PROCEDURE Adyacencia(VAR n : TNodoG; VAR ady : TListaAdy);
PROCEDURE UnionNodoG(VAR n : TNodoG; e : TElemento);
PROCEDURE MostrarNodoG(n : TNodoG);
PROCEDURE ConstruirNodoG(VAR n : TNodoG; e : TAdy);

implementation

PROCEDURE AsignarNodoG(VAR n : TNodoG; e : TElemento);
BEGIN
  Asignar(n.nodo, e);
  CrearListaVacia(n.ady);
END;

FUNCTION EsIgualNodoG(VAR n : TNodoG; e : TElemento) : Boolean;
BEGIN
  EsIgualNodoG := EsIgual(n.nodo, e);
END;

PROCEDURE Adyacencia(VAR n : TNodoG; VAR ady : TListaAdy);
BEGIN
  ady := n.ady;
END;

PROCEDURE UnionNodoG(VAR n : TNodoG; e : TElemento);
BEGIN
  UnionElementos(n.nodo, e);
END;

PROCEDURE MostrarNodoG(n : TNodoG);
BEGIN
  Mostrar(n.nodo);
  writeln('-----------------------------------------');
  writeln('Conecta con las siguientes estaciones : ');
  MostrarLista(n.ady);
end;

PROCEDURE ConstruirNodoG(VAR n : TNodoG; e : TAdy);
BEGIN
  construir(n.ady, e);
end;

end.

