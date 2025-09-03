package terraform.azure.location

import rego.v1

# Default deny policy
default allow := {
    "status": false,
    "reason": "Uno o más recursos no están siendo creados en la región eastus2."
}

# Allow resources that pass the location check
allow := result if {
    count(violations) == 0
    result := {
        "status": true,
        "reason": "Todos los recursos Azure están siendo creados en eastus2."
    }
}

# Required location
required_location := "eastus2"

# Collect location violations
violations contains violation if {
    some resource in input.resource_changes
    startswith(resource.type, "azurerm_")
    resource.change.actions[_] in ["create", "update"]
    resource.change.after.location
    resource.change.after.location != required_location
    violation := {
        "resource": resource.address,
        "current_location": resource.change.after.location,
        "message": sprintf("El recurso '%s' debe crearse en '%s', no en '%s'", [
            resource.address,
            required_location,
            resource.change.after.location
        ])
    }
}
