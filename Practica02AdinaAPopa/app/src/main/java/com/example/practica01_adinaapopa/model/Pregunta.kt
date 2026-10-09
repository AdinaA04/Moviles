package com.example.practica01_adinaapopa.model

import androidx.annotation.StringRes
import com.example.practica01_adinaapopa.R

// Una pregunta del quiz: texto, 3 opciones y el índice (0..2) de la correcta.
data class Pregunta(
    @StringRes val texto: Int,
    @StringRes val opciones: List<Int>,
    val correcta: Int
)

// Banco de preguntas del cuestionario. Para añadir más, solo hay que agregar otra Pregunta a la lista.
object BancoPreguntas {
    val preguntas = listOf(
        Pregunta(R.string.quiz_p1, listOf(R.string.quiz_p1_o1, R.string.quiz_p1_o2, R.string.quiz_p1_o3), 0),
        Pregunta(R.string.quiz_p2, listOf(R.string.quiz_p2_o1, R.string.quiz_p2_o2, R.string.quiz_p2_o3), 1),
        Pregunta(R.string.quiz_p3, listOf(R.string.quiz_p3_o1, R.string.quiz_p3_o2, R.string.quiz_p3_o3), 2)
    )
}
