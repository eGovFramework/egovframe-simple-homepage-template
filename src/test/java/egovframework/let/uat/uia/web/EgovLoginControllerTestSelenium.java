package egovframework.let.uat.uia.web;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import lombok.extern.slf4j.Slf4j;

@Slf4j
class EgovLoginControllerTestSelenium {

	WebDriver driver;

	@BeforeEach
	public void setup() {
		driver = new ChromeDriver();
	}

	@Test
	void test() {
		if (log.isDebugEnabled()) {
			log.debug("[로그인] 셀레늄 단위 테스트");
		}

		// given

		// 로그인 화면 이동
		driver.get("http://localhost:8080/sht_webapp/uat/uia/egovLoginUsr.do");

		JavascriptExecutor javascriptExecutor = (JavascriptExecutor) driver;

		// 새로고침
		sleep();
		javascriptExecutor.executeScript("location.reload();");

		// 아이디 입력
		sleep();
		WebElement idWebElement = driver.findElement(By.id("id"));
		idWebElement.sendKeys("admin");

		// 비밀번호 입력
		sleep();
		WebElement passwordWebElement = driver.findElement(By.id("password"));
		passwordWebElement.sendKeys("1");

		// when
		// 로그인 버튼 클릭
		sleep();
		javascriptExecutor.executeScript("actionLogin();");

		// then
		WebElement loginnameWebElement = driver.findElement(By.cssSelector("#header_loginname > a"));

		assertEquals("관리자 님", loginnameWebElement.getText(), "로그인 실패");
	}

	private void sleep() {
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			fail("InterruptedException: Thread.sleep");
		}
	}

}