package com.example.mvvmcodeexample

import androidx.fragment.app.FragmentActivity
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProviders
import com.example.mvvmcodeexample.models.NicePlace
import com.example.mvvmcodeexample.util.ConversorUtil
import com.example.mvvmcodeexample.viewmodels.MainActivityViewModel
import org.junit.Test

import org.junit.Assert.*
import org.junit.runner.RunWith
import org.robolectric.Robolectric
import org.robolectric.RobolectricTestRunner

/**
 * Example local unit test, which will execute on the development machine (host).
 *
 * See [testing documentation](http://d.android.com/tools/testing).
 */
@RunWith(RobolectricTestRunner::class)
class MainActivityUnitTest {
    @Test
    fun getQuantityElements() {
        val controller = Robolectric.buildActivity(FragmentActivity::class.java).setup()

        val mMainActivityViewModel = ViewModelProviders.of(controller.get()).get(MainActivityViewModel::class.java)

        mMainActivityViewModel.init()
        var test = 0

        mMainActivityViewModel.nicePlaces.observe(controller.get(), Observer {
            test = it.size
        })

        assertEquals(8, test)
    }


    @Test
    fun getQuantityContainsElemensNull() {
        val controller = Robolectric.buildActivity(FragmentActivity::class.java).setup()

        val mMainActivityViewModel = ViewModelProviders.of(controller.get()).get(MainActivityViewModel::class.java)

        mMainActivityViewModel.init()
        mMainActivityViewModel.nicePlaces.observe(controller.get(), Observer { nicePlace ->

            for (niceplace in nicePlace) {
                print(niceplace.imageUrl)
                assertEquals(false, niceplace.imageUrl == null)
            }

        })
    }
    
    @Test
    fun setElements() {
        val controller = Robolectric.buildActivity(FragmentActivity::class.java).setup()

        val mMainActivityViewModel = ViewModelProviders.of(controller.get()).get(MainActivityViewModel::class.java)

        mMainActivityViewModel.init()

        mMainActivityViewModel.addNewValue(
            NicePlace(
                "https://i.imgur.com/ZcLLrkY.jpg",
                "Washington"
            )
        )

        mMainActivityViewModel.nicePlaces.observe(controller.get(), Observer { nicePlace ->
            assertEquals("Não adicionou o elemento", 9, nicePlace.count())
        })
    }


    @Test
    fun testConvertDoubleInMoney() {
        val actual = ConversorUtil.moneyFormat(212.0)
        // expected value is 100
        val expected = "R$212,00"
        // use this method because float is not precise
        assertEquals("Conversion from celsius to fahrenheit failed", expected, actual)
    }


}
