use serde::{Deserialize, Serialize};
use cosmwasm_std::{Addr, Storage};
use cosmwasm_storage::{singleton, singleton_read, ReadonlySingleton, Singleton};
use universe::species::{SapienceScale, Sapient};

// add the static constant here

pub fn config(storage: &mut dyn Storage) -> Singleton<State> {
    // add singleton here
}

pub fn config_read(storage: &dyn Storage) -> ReadonlySingleton<State> {
    // add singleton_read here
}

#[derive(Serialize, Deserialize)]
pub struct State {
    pub owner: Addr,
    pub planet_name: String,
    pub planet_sapients: Vec<Sapient>,
    pub minimum_sapience: SapienceScale,
}