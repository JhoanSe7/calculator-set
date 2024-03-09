import 'package:calculator/pages/generator_page.dart';

final Map<int, String> setLBL = {
  1: "Si un elemento está en un conjunto, se dice que pertenece al conjunto y en este caso usamos el símbolo ∈ para mostrar esta relación. Si un elemento no está en un conjunto, se dice que no pertenece al conjunto y en este caso usamos el símbolo ∉ para mostrar esta relación.",
  2: "La unión de conjuntos es correspondiente la unificación de los elementos de dos conjuntos o incluso más conjuntos, que pueden partiendo de esto conformar una nueva forma de conjunto, en la cual los elementos dentro de este correspondan a los elementos de los conjuntos originales. Cuando un elemento es repetido, forma parte del conjunto unión una vez sólamente; esto difiere de la unión de conjuntos en la concepción tradicional de la suma, en la cual los elementos comunes se consideran tantas veces como se encuentren en la totalidad de los conjuntos. El símbolo que representa a la unión es U.",
  3: "La intersección de dos (o más) conjuntos es una operación que resulta en otro conjunto que contiene los elementos comunes a los conjuntos partida.",
  4: "El complemento de un conjunto o conjunto complementario es otro conjunto que contiene todos los elementos que no están en el conjunto original. Para poder definirlo es necesario especificar qué tipo de elementos se están utilizando, o de otro modo, cuál es el conjunto universal.",
  5: "La diferencia absoluta entre dos conjuntos es una forma de describir todos los elementos que están presentes en un conjunto pero que no están presentes en el otro conjunto. Esencialmente, se trata de los elementos exclusivos de un conjunto en comparación con otro.",
  6: "La diferencia simétrica entre dos conjuntos es una operación que describe todos los elementos que están presentes en uno u otro conjunto, pero no en ambos conjuntos al mismo tiempo. Es decir, son los elementos que están en el conjunto A y en el conjunto B, pero no en la intersección de ambos conjuntos.",
};

final Map<int, String> stringLBL = {
  1: "La longitud de una cadena se refiere a cuántos caracteres o símbolos hay en esa cadena. Por ejemplo, si tienes la cadena 'hola', su longitud es 4, porque contiene cuatro letras.Por otro lado, la cadena vacía, a veces representada como λ (letra griega lambda), no contiene ningún carácter o símbolo. Por lo tanto, su longitud es 0.",
  2: "La concatenación es una operación que consiste en unir dos cadenas o palabras para formar una nueva cadena más larga. En la teoría de cadenas, se representa la concatenación con un punto (.), donde el punto indica que se están uniendo las dos cadenas.",
  3: "La potenciación de cadenas es una operación que implica repetir una cadena cierto número de veces. Se representa mediante el uso del símbolo de potencia (^). Por ejemplo, si tenemos una cadena 'x' y queremos repetirla tres veces, escribimos 'x^2'.",
  4: "La reflexión, inversa o trasposición de una palabra implica revertir el orden de los símbolos que componen la palabra original. Si una palabra x está formada por los símbolos A1,A2,...,An, entonces la palabra inversa de x, denotada como x^R, se forma invirtiendo el orden de los símbolos en la palabra original.",
};

final Map<int, String> languageLBL = {
  1: "La concatenación de lenguajes es una operación que consiste en combinar todas las posibles combinaciones de cadenas de dos lenguajes diferentes. Si tenemos dos lenguajes A y B, la concatenación de estos lenguajes se denota como A⋅B. Para cada cadena x en A y cada cadena y en B, la concatenación de A y B producirá una nueva cadena xy.",
  2: "La potencia i-ésima de un lenguaje A, denotada como A^i, corresponde a la concatenación de A consigo mismo i veces. Esto significa que tomamos todas las posibles combinaciones de cadenas de A de longitud i.",
  3: "La reflexión, también conocida como inversa o trasposición, de un lenguaje A se obtiene al aplicar la operación de reflexión a cada una de las palabras en el lenguaje original. La reflexión de un lenguaje A, denotada como A^R, se forma invirtiendo cada una de las palabras en A, de manera individual.",
  4: "La unión de dos lenguajes A y B, denotada como A U B, contiene todas las palabras que pertenecen a cualquiera de los dos lenguajes. Es decir, A U B consiste en todas las palabras que están en A  o en B, o en ambos.",
  5: "La intersección de dos lenguajes A y B, denotada como A ∩ B , contiene todas las palabras que pertenecen tanto a A como a B. En otras palabras, A ∩ B consiste en todas las palabras que están presentes en ambos lenguajes.",
  6: "La resta de dos lenguajes A  y B, denotada como A-B , contiene todas las palabras que pertenecen a A pero no pertenecen a B. En otras palabras, A-B consiste en todas las palabras que están presentes en A pero no están presentes en B",
  7: "La clausura de Kleene te permite crear todas las posibles palabras que se pueden formar con un conjunto de letras, incluyendo la palabra vacía (sin letras).  Puedes repetir las letras tantas veces como quieras. ",
  8: "La clausura positiva te permite crear todas las posibles palabras que se pueden formar con un conjunto de letras, sin incluir la palabra vacía. Es como un bloque de construcción para crear palabras, similar a como las letras forman palabras y las palabras forman oraciones.",
};

String getLBL(ViewPage view, int index) {
  switch (view) {
    case ViewPage.set:
      return setLBL[index] ?? '';
    case ViewPage.string:
      return stringLBL[index] ?? '';
    case ViewPage.language:
      return languageLBL[index] ?? '';
    default:
      return '';
  }
}
