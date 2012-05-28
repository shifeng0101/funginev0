package util;

public abstract class RepeatedThread extends Stoppable {
	/**
	 * @uml.property name="waitTime"
	 */
	private long waitTime;

	public RepeatedThread(long waitTime, String name) {
		super(name);
		this.waitTime = waitTime;
	}

	public RepeatedThread(long waitTime, int priority, String name) {
		this(waitTime,name);
		this.setPriority(priority);
	}

	public void run() {
		Log.log(this, " started!");
		running = true;
		while (running) {
			executeRepeatedly();
			waitSomeTime();
		}
		Log.log(this, " terminated!");
	}

	protected void waitSomeTime() {
		Thread.yield();
		try {
			Thread.sleep(waitTime);
		} catch (InterruptedException e) {
			running = false;
		}
	}

	public void stopThread() {
		super.stopThread();
		this.interrupt();
	}

	protected abstract void executeRepeatedly();

}
