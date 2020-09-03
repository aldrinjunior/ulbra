package com.example.pobrecomdinheiro


import android.os.Build
import android.util.Log
import androidx.annotation.RequiresApi
import java.io.IOException

class CardService {

    val http = CardHttp()

    //https://www.mercadobitcoin.net/api/BTC/ticker/

    @RequiresApi(Build.VERSION_CODES.O)
    fun getAllCoinsCards() : List<Card> {
        val cards = mutableListOf<Card>()
        val response = http.requestAllCoins() ?: return cards
        try {
            for (i in 0 until response.length()) {

                val data = response.getJSONObject(i)
                val card = Card(
                    data.getString("high"),
                    data.getString("low"),
                    data.getString("vol"),
                    data.getString("buy"),
                    ""
                )
            }
        } catch (e: IOException) {
            Log.e("Error: ", e.message)
        }
        return cards
    }

    @RequiresApi(Build.VERSION_CODES.O)
    fun getCardDetail(coin: String?): List<Card> {
        val cards = mutableListOf<Card>();
        val response = http.requestCoinDetail() ?: return cards
        try {
            for (i in 0 until response.length()) {
                val data = response.getJSONObject(i)
                val card = Card(
                    data.getString("high"),
                    data.getString("low"),
                    data.getString("vol"),
                    data.getString("buy")
                )
                cards.add(card)
            }
        } catch (e: IOException) {
            Log.e("Error: ", e.message)
        }
        return cards;
    }

@RequiresApi(Build.VERSION_CODES.O)
fun getRequestMethod(uf: String) : Card? {
        val data = http.requestMethod(method) ?: return null
        try {
            return Card(
                data.getString("high"),
                data.getString("low"),
                data.getString("vol"),
                data.getString("buy")
            )
        } catch (e: IOException) {
            Log.e("Error: ", e.message)
        }
        return null
    }
}