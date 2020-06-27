package com.example.coronga_app

import android.util.Log
import org.json.JSONObject
import java.io.IOException


class CardService {

    val http = CardHttp()

//    fun getTotalWordCard() : Card {
//        return Card("1", 1, 1, 1, "");
//    }

    fun getContriesCards() : List<Card> {
        val cards = mutableListOf<Card>()
        val response = http.requestContries() ?: return cards
        try {
            for (i in 0 until response.length()) {

                val data = response.getJSONObject(i)
                val card = Card(
                    data.getString("country"),
                    data.getInt("deaths"),
                    data.getInt("confirmed"),
                    data.getString("recovered"),
                    ""
                )
                if (card.titulo.toUpperCase() == "BRAZIL") {
                    cards.add(0, card)
                } else  {
                    cards.add(card)
                }
            }
        } catch (e: IOException) {
            Log.e("Error: ", e.message)
        }
        return cards
    }

    fun getEstatesCards() : List<Card> {
        val cards = mutableListOf<Card>();
        val response = http.requestEstates() ?: return cards
        try {
            for (i in 0 until response.length()) {
                val data = response.getJSONObject(i)
                val card = Card(
                    data.getString("state"),
                    data.getInt("deaths"),
                    data.getInt("cases"),
                    data.getString("refuses"),
                    data.getString("uf")
                )
                cards.add(card)
            }
        } catch (e: IOException) {
            Log.e("Error: ", e.message)
        }
        return cards;
    }

    fun getCardDetail(uf: String) : Card? {
        val data = http.requestDetail(uf) ?: return null
        try {
            return Card(
                data.getString("state"),
                data.getInt("deaths"),
                data.getInt("cases"),
                data.getString("refuses"),
                data.getString("uf")
            )
        } catch (e: IOException) {
            Log.e("Error: ", e.message)
        }
        return null
    }
}