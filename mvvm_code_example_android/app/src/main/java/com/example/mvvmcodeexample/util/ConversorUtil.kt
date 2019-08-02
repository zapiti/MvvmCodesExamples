package com.example.mvvmcodeexample.util

import java.text.DecimalFormat
import java.text.DecimalFormatSymbols
import java.util.*

object ConversorUtil {
    fun moneyFormat(double: Double): String? {
        val symbols = DecimalFormatSymbols()
        symbols.decimalSeparator = ','
        val decimalFormat = DecimalFormat("###,###,###,##0.00", symbols)
        decimalFormat.decimalFormatSymbols = DecimalFormatSymbols(Locale("pt", "BR"))


        val prezzo = if (double < 0.0 || double == -0.0) {
            decimalFormat.format(0.0)
        } else {
            decimalFormat.format(double)
        }




        return "R$" + prezzo.format("%.2f")
    }
}