package com.eval.coronakit.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eval.coronakit.entity.CoronaKit;
import com.eval.coronakit.entity.KitDetail;
import com.eval.coronakit.entity.ProductMaster;
import com.eval.coronakit.service.CoronaKitService;
import com.eval.coronakit.service.KitDetailService;
import com.eval.coronakit.service.ProductService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CoronaKitService coronaKitService;
	
	@Autowired
	KitDetailService kitDetailService;
	
	@RequestMapping("/home")
	public String home() {
		return "user-home";
	}
	
	@RequestMapping("/show-kit")
	public String showKit(Model model) {
		return "show-cart";
	}

	@RequestMapping("/show-list")
	public String showList(Model model) {
		List<ProductMaster> list = productService.getAllProducts();
		model.addAttribute("productlist", list);
		return "show-all-item-user";
	}
	
	@RequestMapping("/add-to-cart/{productId}")
	public String showKit(@PathVariable("productId") int productId, HttpSession session) {
		ProductMaster product = productService.getProductById(productId);
		if (session.getAttribute("cartItems") == null) {
			List<KitDetail> cart = new ArrayList<KitDetail>();
			KitDetail kit = new KitDetail();
			kit.setQuantity(1);
			kit.setAmount(product.getCost());
			kit.setProductId(product.getId());
			kit.setProductName(product.getProductName());
			cart.add(kit);
			session.setAttribute("cartItems", cart);
		} else {
			List<KitDetail> cart = (List<KitDetail>) session.getAttribute("cartItems");
			int index = this.exists(productId, cart);
			if (index == -1) {
				KitDetail kit = new KitDetail();
				kit.setQuantity(1);
				kit.setAmount(product.getCost());
				kit.setProductId(product.getId());
				kit.setProductName(product.getProductName());
				cart.add(kit);
			} else {
				int quantity = cart.get(index).getQuantity() + 1;
				cart.get(index).setQuantity(quantity);
			}
			session.setAttribute("cartItems", cart);
		}
		return "redirect:/user/show-kit";
	}
	
	@RequestMapping("/checkout")
	public String checkout(Model model) {
		CoronaKit coronaKit = new CoronaKit();
		model.addAttribute("coronaKit", coronaKit);
		return "checkout-address";
		
	}
	
	@RequestMapping("/finalize")
	public String finalizeOrder(String address,Model model,HttpSession session) {
		List<KitDetail> cart = (List<KitDetail>) session.getAttribute("cartItems");
		CoronaKit coronakit = new CoronaKit();
		coronakit.setDeliveryAddress(address);
		coronakit.setTotalAmount(cart.stream().mapToInt(i -> i.getAmount()*i.getQuantity()).sum());
		coronakit.setOrderDate(LocalDateTime.now().toString());
		coronakit = coronaKitService.saveKit(coronakit);
		List<KitDetail> finalKitDetails = new ArrayList<KitDetail>();
		for (int i = 0; i < cart.size(); i++) {
			KitDetail kitItem = cart.get(i);
			kitItem.setCoronaKitId(coronakit.getId());
			kitItem.setAmount(kitItem.getAmount() * kitItem.getQuantity());
			finalKitDetails.add(kitDetailService.addKitItem(kitItem));
		}
		model.addAttribute("CoronaKit", coronakit);
		model.addAttribute("KitDetails", finalKitDetails);
		return "show-summary";
	}
	
	@RequestMapping("/delete/{itemId}")
	public String deleteItem(@PathVariable("itemId") int itemId, HttpSession session) {
		List<KitDetail> cart = (List<KitDetail>) session.getAttribute("cartItems");
		int index = this.exists(itemId, cart);
		cart.remove(index);
		if (cart.isEmpty()) {
			session.setAttribute("cartItems", null);
			return "redirect:/user/show-list";
		}
		session.setAttribute("cartItems", cart);
		return "redirect:/user/show-kit";
	}

	private int exists(int id, List<KitDetail> cart) {
		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getProductId() == id) {
				return i;
			}
		}
		return -1;
	}
	
}
