package com.soheibKehal.CashApi.controller;


import com.soheibKehal.CashApi.Qrcode.ZXingHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;

@Controller
@RequestMapping("/products")
public class ProductController {
    @RequestMapping(value = "/qrcode/{id}", method = RequestMethod.GET)
    public void qrcode(@PathVariable("id") String id, HttpServletResponse response) throws Exception {
        response.setContentType("image/png");
        OutputStream outputStream = response.getOutputStream();
        outputStream.write(ZXingHelper.getQRCodeImage(id, 200, 200));
        outputStream.flush();
        outputStream.close();
    }
}
