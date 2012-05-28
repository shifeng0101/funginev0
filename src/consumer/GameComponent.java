package consumer;

import java.util.HashMap;
import java.util.Map;

import component.ObjectComponent;

import world.GameObject;

public class GameComponent<T extends ObjectComponent> {
	/**
	 * @uml.property  name="objectMapping"
	 * @uml.associationEnd  qualifier="valueOf:java.lang.Integer component.ObjectComponent"
	 */
	protected Map<Integer, T> objectMapping = new HashMap<Integer, T>();

	public void set(int obj, T comp) {
		objectMapping.put(obj, comp);
	}

	public void remove(int obj) {
		objectMapping.remove(obj);
	}
}
