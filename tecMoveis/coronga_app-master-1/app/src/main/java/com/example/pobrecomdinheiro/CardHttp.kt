package com.example.pobrecomdinheiro


import android.os.Build
import android.util.Log
import androidx.annotation.RequiresApi
import org.json.JSONArray
import org.json.JSONObject
import java.io.ByteArrayOutputStream
import java.io.IOError
import java.io.IOException
import java.io.InputStream
import java.net.HttpURLConnection
import java.net.URL
import java.nio.charset.Charset
import java.nio.file.Path
import java.nio.file.Paths

class CardHttp {

    val HOST = "https://www.mercadobitcoin.net/api";

    @RequiresApi(Build.VERSION_CODES.O)
    fun requestAllCoins(coin: String) : JSONArray? {
        return request("/coins")?.getJSONArray("data")
    }

    @RequiresApi(Build.VERSION_CODES.O)
    fun requestCoinDetail(coin: String) : JSONArray? {
        return request("/$coin/ticker")?.getJSONArray("data")
    }

    @RequiresApi(Build.VERSION_CODES.O)
    fun requestMethod(coin: String, method: String) : JSONArray? {
        return request("/$coin/$method")?.getJSONArray("data")
    }

    @RequiresApi(Build.VERSION_CODES.O)
    fun requestTrades(coin: String, method: String) : JSONObject? {
        return request("/$coin/$method/trades/")
    }

    @RequiresApi(Build.VERSION_CODES.O)
    private fun request(path: String): JSONObject? {
        try {
            val url = URL(Paths.get(HOST, path).toString())
            val conn = connect(url)
            val responseCode = conn.responseCode
            if (responseCode != HttpURLConnection.HTTP_OK) {
                throw IOException("Error on connect STATUS CODE: $responseCode");
            }
            val inputStream = conn.inputStream
            val jsonString = streamToString(inputStream)
            return JSONObject(jsonString)
        } catch (e: IOException) {
            Log.e("Error: ", e.message);
            e.printStackTrace();
        }
        return null
    }

    private fun connect(url: URL): HttpURLConnection {
        val second = 1000
        val connection = (url.openConnection() as HttpURLConnection).apply {
            readTimeout = 10 * second
            connectTimeout = 15 * second
            requestMethod = "GET"
            doInput = true
            doOutput = false
        }
        connection.connect()
        return connection
    }

    private fun streamToString(inputStream: InputStream):String{
        val buffer =ByteArray(1024)
        val bigBuffer = ByteArrayOutputStream()
        var bytesRead: Int
        while (true){
            bytesRead = inputStream.read(buffer)
            if (bytesRead == -1) break
            bigBuffer.write(buffer,0,bytesRead)
        }
        return String(bigBuffer.toByteArray(), Charset.forName("UTF-8"))
    }

//    fun requestCoinDetail(): JSONArray? {
//
//    }

}