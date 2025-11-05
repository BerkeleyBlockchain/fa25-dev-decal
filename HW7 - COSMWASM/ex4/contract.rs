use cosmwasm_std::{
    entry_point, DepsMut, Env, MessageInfo, Response
};
use crate::error::ContractError;
use crate::msg::{InstantiateMsg};

#[entry_point]
pub fn instantiate(
   // add parameters here 
) -> Result<Response, ContractError> {
    Ok(Response::default())
}