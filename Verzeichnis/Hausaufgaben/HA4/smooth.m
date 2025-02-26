(* Content-type: application/vnd.wolfram.mathematica *)

(*** Wolfram Notebook File ***)
(* http://www.wolfram.com/nb *)

(* CreatedBy='Wolfram 14.2' *)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[       154,          7]
NotebookDataLength[     11109,        309]
NotebookOptionsPosition[     10752,        295]
NotebookOutlinePosition[     11149,        311]
CellTagsIndexPosition[     11106,        308]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 RowBox[{
  RowBox[{"(*", 
   RowBox[{"Bildpfad", " ", "definieren"}], "*)"}], 
  RowBox[{
   RowBox[{
    RowBox[{
    "imagePath", 
     "=", "\"\</Users/gerwinbacher/Hotzone/Uni/Semester_3/WAP/Haus\
\[UDoubleDot]bung/A4/image.jpeg\>\""}], ";"}], "\n", 
   RowBox[{
    RowBox[{"outputDir", "=", 
     RowBox[{"DirectoryName", "[", "imagePath", "]"}]}], ";"}], 
   "\[IndentingNewLine]", "\n", 
   RowBox[{"(*", 
    RowBox[{"Bild", " ", "einlesen"}], "*)"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"img", "=", 
     RowBox[{"Import", "[", "imagePath", "]"}]}], ";"}], 
   "\[IndentingNewLine]", "\n", 
   RowBox[{"(*", 
    RowBox[{
     RowBox[{
     "Konvertierung", " ", "zu", " ", "Grauwert", " ", "nach", " ", "der", " ",
       "gegebenen", " ", "Formel", " ", "Y"}], "=", 
     RowBox[{
      RowBox[{"0.5", "G"}], "+", 
      RowBox[{"0.3", "R"}], "+", 
      RowBox[{"0.2", "B"}]}]}], "*)"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"grayImg", "=", 
     RowBox[{"ImageApply", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{
           RowBox[{"#", "[", 
            RowBox[{"[", "1", "]"}], "]"}], "*", "0.3"}], "+", 
          RowBox[{
           RowBox[{"#", "[", 
            RowBox[{"[", "2", "]"}], "]"}], "*", "0.5"}], "+", 
          RowBox[{
           RowBox[{"#", "[", 
            RowBox[{"[", "3", "]"}], "]"}], "*", "0.2"}]}], "}"}], "&"}], ",",
        "img"}], "]"}]}], ";"}], "\[IndentingNewLine]", "\n", 
   RowBox[{"(*", 
    RowBox[{
     RowBox[{"smooth", ".", "m"}], " ", "Funktion", " ", "f\[UDoubleDot]r", " ",
      "Mittelwertberechnung", " ", "im", " ", "Fenster"}], "*)"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     RowBox[{"smooth", "[", 
      RowBox[{"pos_", ",", "size_"}], "]"}], ":=", 
     RowBox[{"Module", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
        "imgData", ",", "x0", ",", "y0", ",", "xRange", ",", "yRange", ",", 
         "values"}], "}"}], ",", 
       RowBox[{
        RowBox[{"imgData", "=", 
         RowBox[{"ImageData", "[", "grayImg", "]"}]}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"x0", ",", "y0"}], "}"}], "=", "pos"}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{"xRange", "=", 
         RowBox[{
          RowBox[{"Max", "[", 
           RowBox[{"1", ",", 
            RowBox[{"x0", "-", 
             RowBox[{"Floor", "[", 
              RowBox[{"size", "/", "2"}], "]"}]}]}], "]"}], ";;", 
          RowBox[{"Min", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"ImageDimensions", "[", "grayImg", "]"}], "[", 
             RowBox[{"[", "1", "]"}], "]"}], ",", 
            RowBox[{"x0", "+", 
             RowBox[{"Floor", "[", 
              RowBox[{"size", "/", "2"}], "]"}]}]}], "]"}]}]}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{"yRange", "=", 
         RowBox[{
          RowBox[{"Max", "[", 
           RowBox[{"1", ",", 
            RowBox[{"y0", "-", 
             RowBox[{"Floor", "[", 
              RowBox[{"size", "/", "2"}], "]"}]}]}], "]"}], ";;", 
          RowBox[{"Min", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"ImageDimensions", "[", "grayImg", "]"}], "[", 
             RowBox[{"[", "2", "]"}], "]"}], ",", 
            RowBox[{"y0", "+", 
             RowBox[{"Floor", "[", 
              RowBox[{"size", "/", "2"}], "]"}]}]}], "]"}]}]}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{"values", "=", 
         RowBox[{"imgData", "[", 
          RowBox[{"[", 
           RowBox[{"yRange", ",", "xRange"}], "]"}], "]"}]}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{"Mean", "[", 
         RowBox[{"Flatten", "[", "values", "]"}], "]"}]}]}], "]"}]}], ";"}], 
   "\[IndentingNewLine]", "\n", 
   RowBox[{"(*", 
    RowBox[{"Ausgabedatei", " ", "vorbereiten", " ", "f\[UDoubleDot]r", " ", 
     RowBox[{"smooth3", ".", "pgm"}]}], "*)"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"dims", "=", 
     RowBox[{"ImageDimensions", "[", "grayImg", "]"}]}], ";"}], "\n", 
   RowBox[{
    RowBox[{"stream3", "=", 
     RowBox[{"OpenWrite", "[", 
      RowBox[{
       RowBox[{"FileNameJoin", "[", 
        RowBox[{"{", 
         RowBox[{"outputDir", ",", "\"\<smooth3.pgm\>\""}], "}"}], "]"}], ",", 
       RowBox[{"FormatType", "->", "OutputForm"}]}], "]"}]}], ";"}], "\n", 
   RowBox[{
    RowBox[{"WriteString", "[", 
     RowBox[{"stream3", ",", 
      RowBox[{"\"\<P2\\n\>\"", "<>", 
       RowBox[{"ToString", "[", 
        RowBox[{"dims", "[", 
         RowBox[{"[", "1", "]"}], "]"}], "]"}], "<>", "\"\< \>\"", "<>", 
       RowBox[{"ToString", "[", 
        RowBox[{"dims", "[", 
         RowBox[{"[", "2", "]"}], "]"}], "]"}], "<>", "\"\<\\n255\\n\>\""}]}],
      "]"}], ";"}], "\[IndentingNewLine]", "\n", 
   RowBox[{"(*", 
    RowBox[{
    "3", "x3", " ", "Gl\[ADoubleDot]ttung", " ", "berechnen", " ", "und", " ",
      "in", " ", "PGM", " ", "schreiben"}], "*)"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Do", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"pixelValue", "=", 
        RowBox[{"Round", "[", 
         RowBox[{"255", "*", 
          RowBox[{"smooth", "[", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"x", ",", "y"}], "}"}], ",", "3"}], "]"}]}], "]"}]}], ";",
        "\[IndentingNewLine]", 
       RowBox[{"WriteString", "[", 
        RowBox[{"stream3", ",", 
         RowBox[{
          RowBox[{"ToString", "[", "pixelValue", "]"}], "<>", "\"\< \>\""}]}],
         "]"}]}], ",", 
      RowBox[{"{", 
       RowBox[{"y", ",", "1", ",", 
        RowBox[{"dims", "[", 
         RowBox[{"[", "2", "]"}], "]"}]}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{"x", ",", "1", ",", 
        RowBox[{"dims", "[", 
         RowBox[{"[", "1", "]"}], "]"}]}], "}"}]}], "]"}], ";"}], "\n", 
   RowBox[{
    RowBox[{"Close", "[", "stream3", "]"}], ";"}], "\[IndentingNewLine]", 
   "\n", 
   RowBox[{"(*", 
    RowBox[{"Ausgabedatei", " ", "vorbereiten", " ", "f\[UDoubleDot]r", " ", 
     RowBox[{"smooth5", ".", "pgm"}]}], "*)"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"stream5", "=", 
     RowBox[{"OpenWrite", "[", 
      RowBox[{
       RowBox[{"FileNameJoin", "[", 
        RowBox[{"{", 
         RowBox[{"outputDir", ",", "\"\<smooth5.pgm\>\""}], "}"}], "]"}], ",", 
       RowBox[{"FormatType", "->", "OutputForm"}]}], "]"}]}], ";"}], "\n", 
   RowBox[{
    RowBox[{"WriteString", "[", 
     RowBox[{"stream5", ",", 
      RowBox[{"\"\<P2\\n\>\"", "<>", 
       RowBox[{"ToString", "[", 
        RowBox[{"dims", "[", 
         RowBox[{"[", "1", "]"}], "]"}], "]"}], "<>", "\"\< \>\"", "<>", 
       RowBox[{"ToString", "[", 
        RowBox[{"dims", "[", 
         RowBox[{"[", "2", "]"}], "]"}], "]"}], "<>", "\"\<\\n255\\n\>\""}]}],
      "]"}], ";"}], "\[IndentingNewLine]", "\n", 
   RowBox[{"(*", 
    RowBox[{
    "5", "x5", " ", "Gl\[ADoubleDot]ttung", " ", "berechnen", " ", "und", " ",
      "in", " ", "PGM", " ", "schreiben"}], "*)"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Do", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"pixelValue", "=", 
        RowBox[{"Round", "[", 
         RowBox[{"255", "*", 
          RowBox[{"smooth", "[", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"x", ",", "y"}], "}"}], ",", "5"}], "]"}]}], "]"}]}], ";",
        "\[IndentingNewLine]", 
       RowBox[{"WriteString", "[", 
        RowBox[{"stream5", ",", 
         RowBox[{
          RowBox[{"ToString", "[", "pixelValue", "]"}], "<>", "\"\< \>\""}]}],
         "]"}]}], ",", 
      RowBox[{"{", 
       RowBox[{"y", ",", "1", ",", 
        RowBox[{"dims", "[", 
         RowBox[{"[", "2", "]"}], "]"}]}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{"x", ",", "1", ",", 
        RowBox[{"dims", "[", 
         RowBox[{"[", "1", "]"}], "]"}]}], "}"}]}], "]"}], ";"}], "\n", 
   RowBox[{
    RowBox[{"Close", "[", "stream5", "]"}], ";"}], "\[IndentingNewLine]", 
   "\n", 
   RowBox[{"(*", 
    RowBox[{"Ausgabedatei", " ", "vorbereiten", " ", "f\[UDoubleDot]r", " ", 
     RowBox[{"smooth7", ".", "pgm"}]}], "*)"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"stream7", "=", 
     RowBox[{"OpenWrite", "[", 
      RowBox[{
       RowBox[{"FileNameJoin", "[", 
        RowBox[{"{", 
         RowBox[{"outputDir", ",", "\"\<smooth7.pgm\>\""}], "}"}], "]"}], ",", 
       RowBox[{"FormatType", "->", "OutputForm"}]}], "]"}]}], ";"}], "\n", 
   RowBox[{
    RowBox[{"WriteString", "[", 
     RowBox[{"stream7", ",", 
      RowBox[{"\"\<P2\\n\>\"", "<>", 
       RowBox[{"ToString", "[", 
        RowBox[{"dims", "[", 
         RowBox[{"[", "1", "]"}], "]"}], "]"}], "<>", "\"\< \>\"", "<>", 
       RowBox[{"ToString", "[", 
        RowBox[{"dims", "[", 
         RowBox[{"[", "2", "]"}], "]"}], "]"}], "<>", "\"\<\\n255\\n\>\""}]}],
      "]"}], ";"}], "\[IndentingNewLine]", "\n", 
   RowBox[{"(*", 
    RowBox[{
    "7", "x7", " ", "Gl\[ADoubleDot]ttung", " ", "berechnen", " ", "und", " ",
      "in", " ", "PGM", " ", "schreiben"}], "*)"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Do", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"pixelValue", "=", 
        RowBox[{"Round", "[", 
         RowBox[{"255", "*", 
          RowBox[{"smooth", "[", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"x", ",", "y"}], "}"}], ",", "7"}], "]"}]}], "]"}]}], ";",
        "\[IndentingNewLine]", 
       RowBox[{"WriteString", "[", 
        RowBox[{"stream7", ",", 
         RowBox[{
          RowBox[{"ToString", "[", "pixelValue", "]"}], "<>", "\"\< \>\""}]}],
         "]"}]}], ",", 
      RowBox[{"{", 
       RowBox[{"y", ",", "1", ",", 
        RowBox[{"dims", "[", 
         RowBox[{"[", "2", "]"}], "]"}]}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{"x", ",", "1", ",", 
        RowBox[{"dims", "[", 
         RowBox[{"[", "1", "]"}], "]"}]}], "}"}]}], "]"}], ";"}], "\n", 
   RowBox[{
    RowBox[{"Close", "[", "stream7", "]"}], ";"}]}]}]], "Input",
 CellChangeTimes->{{3.947656789902533*^9, 3.947656789904661*^9}},
 CellLabel->"In[46]:=",ExpressionUUID->"d7af0a2b-5e93-4f84-ae77-a7a58cfb2850"]
},
WindowSize->{808, 789},
WindowMargins->{{Automatic, 348}, {Automatic, 0}},
FrontEndVersion->"14.2 for Mac OS X ARM (64-bit) (December 26, 2024)",
StyleDefinitions->"Default.nb",
ExpressionUUID->"3dd5f7aa-ac85-4501-9743-4a25db6040b7"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[554, 20, 10194, 273, 1377, "Input",ExpressionUUID->"d7af0a2b-5e93-4f84-ae77-a7a58cfb2850"]
}
]
*)

