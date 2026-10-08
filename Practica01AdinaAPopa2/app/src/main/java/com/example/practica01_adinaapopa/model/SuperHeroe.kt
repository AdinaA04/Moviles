package com.example.practica01_adinaapopa.model

import android.os.Parcel
import android.os.Parcelable

// Objeto SuperHeroe parcelable para poder enviarlo entre Activities con un Intent.
// Se implementa a mano para no depender del plugin kotlin-parcelize (evita problemas de versiones de Gradle).
data class SuperHeroe(
    val nombre: String,
    val alterEgo: String,
    val bio: String,
    val power: Float
) : Parcelable {

    constructor(parcel: Parcel) : this(
        parcel.readString() ?: "",
        parcel.readString() ?: "",
        parcel.readString() ?: "",
        parcel.readFloat()
    )

    override fun writeToParcel(parcel: Parcel, flags: Int) {
        parcel.writeString(nombre)
        parcel.writeString(alterEgo)
        parcel.writeString(bio)
        parcel.writeFloat(power)
    }

    override fun describeContents(): Int = 0

    companion object CREATOR : Parcelable.Creator<SuperHeroe> {
        override fun createFromParcel(parcel: Parcel): SuperHeroe = SuperHeroe(parcel)
        override fun newArray(size: Int): Array<SuperHeroe?> = arrayOfNulls(size)
    }
}
