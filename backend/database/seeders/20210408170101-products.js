"use strict";

const models = require("../../models");
const Category = models.Category;
const Product = models.Product;

module.exports = {
  up: async (queryInterface, Sequelize) => {
    /**
     * Add seed commands here.
     *
     * Example:
     * await queryInterface.bulkInsert('People', [{
     *   name: 'John Doe',
     *   isBetaMember: false
     * }], {});
     */

    // const hamburguesas = await Category.findOne({ where: { name:'HAMBURGUESAS'} })
    // const gaseosas = await Category.findOne({ where: { name:'GASEOSAS'} })

    const northIndian = await Category.findOne({
      where: { name: "NORTH INDIAN" },
    });
    const southIndian = await Category.findOne({
      where: { name: "SOUTH INDIAN" },
    });
    const continental = await Category.findOne({
      where: { name: "CONTINENTAL" },
    });
    const chinese = await Category.findOne({ where: { name: "CHINESE" } });

    await Product.bulkCreate([
      {
        name: "DOSA",
        price: 80,
        stock: 100,
        categoryId: southIndian.id,
      },
      {
        name: "DAL MAKHANI",
        price: 120,
        stock: 150,
        categoryId: northIndian.id,
      },
      {
        name: "BUTTER ROTI",
        price: 15,
        stock: 1000,
        categoryId: northIndian.id,
      },
      {
        name: "MARGHERITA PIZZA",
        price: 150,
        stock: 120,
        categoryId: continental.id,
      },
      {
        name: "CHEESEBURGER",
        price: 80,
        stock: 200,
        categoryId: continental.id,
      },
      {
        name: "HAKKA NOODLES",
        price: 120,
        stock: 180,
        categoryId: chinese.id,
      },
      {
        name: "CHOWMEIN",
        price: 120,
        stock: 225,
        categoryId: chinese.id,
      },
    ]);
  },

  down: async (queryInterface, Sequelize) => {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     * await queryInterface.bulkDelete('People', null, {});
     */

    await queryInterface.bulkDelete("Products", null, {});
  },
};
