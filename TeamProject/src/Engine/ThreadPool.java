package Engine;

import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class ThreadPool extends HttpServlet {

	private static final long serialVersionUID = 1L;
	static ScheduledExecutorService executor;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		int threadPoolQuantity = 10;
		executor = new ScheduledThreadPoolExecutor(threadPoolQuantity);
		System.out.println("[ThreadPool] - Start");
	}

	public static void execute(Runnable command) {
		executor.execute(command);
	}

	public static void scheduleAtFixedRate(Runnable command, long initialDelay, long period) {
		executor.scheduleAtFixedRate(command, initialDelay, period, TimeUnit.SECONDS);
	}

	public void destroy() {
		super.destroy();
		try {
			executor.shutdownNow();
			System.out.println("[ThreadPool] - End");
			executor.awaitTermination(5000, TimeUnit.MILLISECONDS);
			if (!executor.isTerminated()) {
			}
		} catch (InterruptedException ie) {
			ie.printStackTrace();
		}
	}
}