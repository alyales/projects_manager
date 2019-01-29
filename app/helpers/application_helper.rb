module ApplicationHelper
	def bootstrap_class_for(name)
		{
			success: "alert-success",
			danger: "alert-danger",
			error: "alert-danger",
			alert: "alert-warning",
			notice: "alert-success"
		}[name.to_sym] || name
	end
end
