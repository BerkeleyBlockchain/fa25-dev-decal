use serde::{Deserialize, Serialize};
use cosmwasm_std::{Addr, Storage};
use cosmwasm_storage::{ReadonlySingleton, Singleton};
use universe::species::{SapienceScale, Sapient};

// add the config signature here

// add the config_read signature here

#[derive(Serialize, Deserialize)]
pub struct State {
    pub owner: Addr,
    pub planet_name: String,
    pub planet_sapients: Vec<Sapient>,
    pub minimum_sapience: SapienceScale,
}